# Função para exibir uma MessageBox
function MsgBox  ($msgBody){
    Add-Type -AssemblyName PresentationFramework;
    $msgImage = 'Exclamation';
    [System.Windows.MessageBox]::Show($msgBody,'Spam Alert','OK',$msgImage);
}

# Inicia vários jobs em paralelo para exibir as MessageBoxes sem parar
for ($i = 0; $i -lt 10; $i++) {
    Start-ThreadJob -ScriptBlock { 
        function MsgBox  ($msgBody){
            Add-Type -AssemblyName PresentationFramework;
            $msgImage = 'Exclamation';
            [System.Windows.MessageBox]::Show($msgBody,'Spam Alert','OK',$msgImage);
        }
        
        # Loop infinito para gerar spam de MessageBoxes
        $msgBody = "Olááá"+" "+$env:username;
        while ($true) {
            MsgBox($msgBody);
        }
    }
}

