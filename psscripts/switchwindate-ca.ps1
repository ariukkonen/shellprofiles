[Threading.Thread]::CurrentThread.CurrentUICulture = 'en-CA';
[Threading.Thread]::CurrentThread.CurrentCulture = 'en-CA';
$Culture = [Threading.Thread]::CurrentThread.CurrentCulture;
$Culture.DateTimeFormat.ShortDatePattern = 'yyyy-MM-dd';
$Culture = [Threading.Thread]::CurrentThread.CurrentCulture;
