#Limpa a tela do prompt
Clear

#Conecta ao Servico do Power BI
Connect-PowerBIServiceAccount

#Declarar Variavel
$w = Read-Host "Qual o nome do Workspace?"

#Get Workspaces

$Wid = (Get-PowerBIWorkspace -Name $w).Id

#Get Reports

$Rid = Get-PowerBIReport -WorkspaceId $Wid

#Data Atual

$d = Get-Date -Format "dd-MM-yyyyHHmm"


#Estrutura de Repeticao

Foreach($i in $Rid ){

$dir = "./" + $i.Name.Replace(":","-") + "_" + $d + ".pbix"

Write-Host "O arquivo " $i.Name " Esta sendo exportado"

Export-PowerBIReport -Id $i.Id -OutFile $dir


}
