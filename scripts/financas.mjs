#!/usr/bin/env node

import { readFile, writeFile } from 'node:fs/promises'

const __dirname = new URL('.', import.meta.url).pathname

const salarioFileLocation = `${__dirname}/financas/salario.txt`
const gastosComHobbiesFileLocation = `${__dirname}/financas/gastosComHobbies.txt`

let ultimoSalario;
let gastoComHobbies;

try {
  const salarioFromFile = await readFile(salarioFileLocation, 'utf-8')
  ultimoSalario = Number(salarioFromFile)
} catch (error) {
  console.error('Não foi possível ler o arquivo de salário')
}

try {
  const gastoComHobbiesFromFile = await readFile(gastosComHobbiesFileLocation, 'utf-8')
  gastoComHobbies = Number(gastoComHobbiesFromFile)
} catch (error) {
  console.error('Não foi possível ler o arquivo de gastos com hobbies')
}


const textoVermelho = "\x1b[38;5;196m"
const reset = "\x1b[0m";

const contasQuinzenal1 = {
  Simples: 1500,
  Previdencia: 1000,
  Casa: 1500,
  Claro: 200,
  Psicologo: 450,
}

const contasQuinzenal2 = {
  Vivo: 120,
  Energia: 400,
  Inss: 160,
  Simples: 1500,
  Psicologo: 450,
}

const investimentos = {
  ['Casa Financiamento']: 0.3,
  Viagens: 0.1,
  Carreira: 0.1,
  Computador: 0.05,
  Investimentos: 0.15,
}

const lazer = {
  Comida: 0.05,
  Hobbies: 0.2,
  Massagem: 0.05,
}

const totalInvestimentos = Object.values(investimentos).reduce((acc, curr) => acc + curr, 0)
const totalLazer = Object.values(lazer).reduce((acc, curr) => acc + curr, 0)

const salvarSalario = async (salario) => {
  await writeFile(salarioFileLocation, salario)
}

const zerarGastosComHobbies = async () => {
  await writeFile(gastosComHobbiesFileLocation, '0')
}

const adicionarGastosComHobbies = async (gasto) => {
  await writeFile(gastosComHobbiesFileLocation, (gastoComHobbies + gasto).toString())
}

const fazerContas = () => {
  const isCorrectValues = totalLazer + totalInvestimentos === 1

  if (!isCorrectValues) {
    console.error(`${textoVermelho}Os valores de investimentos e lazer devem somar 100%${reset}`)
    return;
  }

  const salario = Number(process.argv[3]) || ultimoSalario

  if (!salario || isNaN(salario)) {
    console.error(`${textoVermelho}Informe o salário!${reset}`)
    return;
  }

  if (salario !== ultimoSalario) {
    salvarSalario(salario.toString())
    zerarGastosComHobbies()
  }

  const quinzenaDoMes = new Date().getDate() < 15 ? 1 : 2

  const contas = quinzenaDoMes === 1 ? contasQuinzenal1 : contasQuinzenal2

  const totalDespesas = Object.values(contas).reduce((acc, curr) => acc + curr, 0)
  const salarioLiquido = salario - totalDespesas

  const investimentosArray = Object.entries(investimentos).map(([key, value]) => {
    return [key, salarioLiquido * value]
  })
  const investimentosObj = Object.fromEntries(investimentosArray)

  const lazerArray = Object.entries(lazer).map(([key, value]) => {
    return [key, salarioLiquido * value]
  })
  const lazerObj = Object.fromEntries(lazerArray)

  console.table({
    'Salário total': salario,
    'Salário liquido': salarioLiquido,
    totalDespesas,
    '-------': '-------',
    ...contas,
    '---------': '---------',
    ...investimentosObj,
    '--------': '--------',
    ...lazerObj,
  })

  console.log('Valor atual para hobbies: ', lazerObj.Hobbies - gastoComHobbies)
}

if (process.argv[2] === 'gastos') {
  const gasto = Number(process.argv[3])
  if (!gasto || isNaN(gasto)) {
    console.error(`${textoVermelho}Informe o gasto com hobbies!${reset}`)
  } else {
    adicionarGastosComHobbies(gasto)
    console.log('Gasto com hobbies adicionado com sucesso!')
  }
}

if (process.argv[2] === 'contas') {
  fazerContas()
}
