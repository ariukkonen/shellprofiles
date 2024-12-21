[Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US';
[Threading.Thread]::CurrentThread.CurrentCulture = 'en-US';
$Culture = [Threading.Thread]::CurrentThread.CurrentCulture;
$Culture.DateTimeFormat.ShortDatePattern = 'yyyy-MM-dd';
$Culture = [Threading.Thread]::CurrentThread.CurrentCulture;
