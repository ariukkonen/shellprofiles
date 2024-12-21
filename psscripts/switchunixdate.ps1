[Threading.Thread]::CurrentThread.CurrentUICulture = '';
[Threading.Thread]::CurrentThread.CurrentCulture =  '';
$Culture = [Threading.Thread]::CurrentThread.CurrentCulture;
$Culture.DateTimeFormat.ShortDatePattern = 'MM/dd/yyyy';
$Culture = [Threading.Thread]::CurrentThread.CurrentCulture;
