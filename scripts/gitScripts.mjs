#!/usr/bin/env node

import { exec, spawn } from "node:child_process";
import * as readline from "node:readline";
import { stdin as input, stdout as output } from "node:process";

// Colors
const bold = "\x1b[1m";
const reset = "\x1b[0m";
const fontCyan = "\x1b[36m";

const rl = readline.createInterface({ input, output });

const question = (query) => {
  return new Promise((resolve) => {
    rl.question(query, (answer) => {
      resolve(answer);
    });
  });
};

const promiseExec = (command) => {
  return new Promise((resolve, reject) => {
    exec(command, (err, stdout) => {
      if (err) {
        reject(err);
        return;
      }
      resolve(stdout);
    });
  });
};

const deleteLocalBranch = (branchName) => {
  exec(`git branch -D ${branchName}`, (err, stdout) => {
    if (err) {
      console.error(err);
      return;
    }
    console.log(stdout);
  });
};

const deleteBranch = async (branchName) => {
  deleteLocalBranch(branchName);
  try {
    const deletedBranch = await promiseExec(`git push -d origin ${branchName}`);
    console.log(deletedBranch);
  } catch (error) {
    console.error(error);
  }
};

const createPR = async (branchToPush, prTitle) => {
  const taskID = await promiseExec(
    `git branch --show-current | grep '/.*' | cut -f 2 -d '/' | cut -f 1 -d '-'`
  );
  const shell = spawn(
    `gh pr create --reviewer leojnxs,armandopmj,danielmana,guimkogus,phelipe-ohlsen,fpudo,kiranyedidi,rrubenich,rtfal --base "${branchToPush}" --title "${taskID}${
      taskID ? " - " : ""
    } ${prTitle}"`,
    [],
    { shell: true, stdio: "inherit" }
  );
  shell.on("exit", (code) => {
    console.log(`Child exited with code ${code}`);
  });
};

const options = [
  `${fontCyan}1.${reset} Delete local branch`,
  `${fontCyan}2.${reset} Delete a branch`,
  `${fontCyan}3.${reset} Deploy to designtest`,
  `${fontCyan}4.${reset} Create a PR`,
  `${fontCyan}5.${reset} quit`,
];

const main = async () => {
  options.forEach((option) => {
    console.log(option);
  });
  const option = await question(`${fontCyan}${bold}Select an option: ${reset}`);
  switch (option) {
    case "1":
      const localBranch = await question("Enter branch name:");
      deleteLocalBranch(localBranch);
      break;
    case "2":
      const branch = await question("Enter branch name:");
      await deleteBranch(branch);
      break;
    case "3":
      const designtestBranch = "designtest";
      await deleteBranch(designtestBranch);
      exec(`git checkout -b ${designtestBranch}`);
      await promiseExec(`git push --set-upstream origin ${designtestBranch}`);
      break;
    case "4":
      const branchToPush = await question(
        "Write the name of the branch you want to push your PR: "
      );
      const prTitle = await question("Write the title of your PR: ");
      createPR(branchToPush, prTitle);
      break;
    case "5":
    case "quit":
    case "x":
    case ":q":
      console.log("Bye!");
      break;
    default:
      console.log("Invalid option");
  }

  rl.close();
};

main();
