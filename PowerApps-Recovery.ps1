#Limpa a tela do prompt
Clear

#Conecta a conta da Power Platform
Add-PowerAppsAccount

#Lista todos os ambientes
Get-AdminPowerAppEnvironment

#Adiciona na variavel o ambiente desejado
$a = Read-Host "Qual ambiente deseja verificar? (EnvironmentName)"

#Limpa tela
Clear

#Printa o ambiente selecionado
Write-Host "Ambiente selecionado: " $a

#Printa tela de load
Write-Host "Iremos listar todos os projetos deletados....aguarde!"


Get-AdminDeletedPowerAppsList -EnvironmentName $a

$c = (Get-AdminDeletedPowerAppsList -EnvironmentName $a).Count


#Adiciona na variavel ref app deletado
$app = Read-Host "Foram encontrados $c app deletados, qual app deseja recuperar? (AppName)"


#Recupera app
Get-AdminRecoverDeletedPowerApp -AppName $app -EnvironmentName $a


#Mensagem final
Write-Host "O app foi restaurado com sucesso!"



