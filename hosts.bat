REM ����
@echo off
set release=11-10-06 19:35
set CU=1245
del %windir%\System32\drivers\etc\hosts#THISISNOTE /s /q
del %windir%\System32\drivers\etc\hosts.tw /s /q
ipconfig /flushdns
echo y|cacls %windir%\system32\drivers\etc\hosts /g everyone:f
attrib -r -a -s -h %windir%\system32\drivers\etc\hosts
if "%1" == "auto" (goto auto) else goto begin

:begin
cls
echo ---------------------------------------------------------------------------
echo Hosts�Զ��޸Ľű�
echo   ����ʱ�䣺%release%
ver | find "5." >nul
if errorlevel 1 echo.& echo ��ȷ�����Ѿ��Թ���Ա������С�
echo ---------------------------------------------------------------------------
echo.
echo 1.��ȫ��װ/����
echo 2.�Զ��尲װ/����
echo.
echo 3.ж��
echo 4.����
echo 5.����˵��
echo.
echo 6.�˳�
echo.
SET /P ST= ��������Ӧ���(1-6)���س�����ֱ�Ӱ�װ:
echo.
if /I "%ST%"=="1" goto auto
if /I "%ST%"=="2" goto custom
if /I "%ST%"=="3" goto delchar
if /I "%ST%"=="4" goto tools
if /I "%ST%"=="5" goto readme
if /I "%ST%"=="6" goto exit
if /I "%ST%"=="" goto install
exit

:readme
cls
echo ---------------------------------------------------------------------------
echo Hosts�Զ��޸Ľű�
echo   ����ʱ�䣺%release%
echo ---------------------------------------------------------------------------
echo �������ݣ�
echo �����ļ���
echo �Ա��汾�������ͣ��
echo.
echo.
pause
goto begin

:tools
cls
echo ---------------------------------------------------------------------------
echo HOSTSp v5_final Tools @ %release%
echo ---------------------------------------------------------------------------
echo.
echo 1.�ָ�����
echo 2.��IP���..
echo 3.���б༭hosts
echo 4.ʹ��www.g.cn��ip
echo.
echo 5.�����ϼ�
echo 6.�˳�

echo.
SET /P TT= ��������Ӧ���(1-6)��
echo.
if /I "%TT%"=="1" goto remove
if /I "%TT%"=="2" goto manualip
if /I "%TT%"=="3" goto edithosts
if /I "%TT%"=="4" goto gcn
if /I "%TT%"=="5" goto begin
if /I "%TT%"=="6" goto exit
if /I "%TT%"=="" goto tools
exit

:auto

goto install

:custom
cls
echo ---------------------------------------------------------------------------
echo HOSTSp v5_a1 Tools @ %release%
echo ---------------------------------------------------------------------------
echo.
echo 1.Google����
echo 2.ȥ���
echo 3.YouTube����������룬Ŀǰ���ܼ�����Ƶ��
echo 4.Twitter+Facebook
echo 5.Dropbox
echo.

SET /P CU= ��������Ӧ���(֧�ֶ�ѡ,��"134","12345")��
echo.
goto install
exit

:install
if exist "%windir%\System32\drivers\etc\hosts_hpbak" (echo �����ļ��Ѵ��ڡ�) else copy %windir%\System32\drivers\etc\hosts %windir%\System32\drivers\etc\hosts_hpbak
cls

echo Hosts�Զ��޸Ľű�
echo ���Ե�һ��,����ͨ�������ȡwww.g.cn��IP��ַ...
echo.

for /f "tokens=2 delims=[]" %%i in ('ping -n 2 www.g.cn') do set IP=%%i
echo %IP%|findstr "203.208.45" >nul && echo ��ȡ����ȷIP��%IP% ||echo ��ȡ�������IP�����ڻ�ȡgpcom.azlyfox.com��IP��ַ && for /f "tokens=2 delims=[]" %%i in ('ping -n 2 gpcom.azlyfox.com') do set IP=%%i

goto doit

:gcn

if exist "%windir%\System32\drivers\etc\hosts_hpbak" (echo �����ļ��Ѵ��ڡ�) else copy %windir%\System32\drivers\etc\hosts %windir%\System32\drivers\etc\hosts_hpbak
cls

echo Hosts�Զ��޸Ľű� 
echo ���Ե�һ��,����ͨ�������ȡwww.g.cn��IP��ַ...
echo.

for /f "tokens=2 delims=[]" %%i in ('ping -n 2 www.g.cn') do set IP=%%i
echo %IP%|findstr "203.208" >nul && echo ��ȡ����ȷIP��%IP% ||echo ��ȡ����203.208��ͷ��IP��%IP%�������޷�ʹ�á� && SET /P ERR= �Ƿ������(y/n)�� && if /I "%ERR%"=="n" goto begin
 
cls
echo ---------------------------------------------------------------------------
echo HOSTSp v5_a1 Tools @ %release%
echo ---------------------------------------------------------------------------
echo.
echo 1.Google����
echo 2.ȥ���
echo 3.YouTube����������룬Ŀǰ���ܼ�����Ƶ��
echo 4.Twitter+Facebook
echo 5.Dropbox
echo.

SET /P CU= ��������Ӧ���(֧�ֶ�ѡ,��"134","12345")��
echo.
goto doit

:manualip

if exist "%windir%\System32\drivers\etc\hosts_hpbak" (echo �����ļ��Ѵ��ڡ�) else copy %windir%\System32\drivers\etc\hosts %windir%\System32\drivers\etc\hosts_hpbak
cls

echo Hosts�Զ��޸Ľű� 
echo.


SET /P pingname= ������һ��IP��
set IP=%pingname%
echo %IP%|findstr "203.208" >nul && echo �������IP�ǣ�%IP% ||echo �������IP�ǣ�%IP%�������޷�ʹ�á� && SET /P ERR= �Ƿ������(y/n)�� && if /I "%ERR%"=="n" goto manualip
cls
echo ---------------------------------------------------------------------------
echo HOSTSp v5_a1 Tools @ %release%
echo ---------------------------------------------------------------------------
echo.
echo 1.Google����
echo 2.ȥ���
echo 3.YouTube����������룬Ŀǰ���ܼ�����Ƶ��
echo 4.Twitter+Facebook
echo 5.Dropbox
echo.

SET /P CU= ��������Ӧ���(֧�ֶ�ѡ,��"134","12345")��
echo.

goto doit

:doit

echo ���ڽ�IP %IP% д��hosts�С�

type %windir%\System32\drivers\etc\hosts|find "#THISISNOTE" /i /v|find "#HAC" /i /v|find "#HostsAutoChanger" /i /v|find "#HWrite" /i /v|findstr ".">>%windir%\System32\drivers\etc\hosts_temp
ren %windir%\System32\drivers\etc\hosts hosts_temp_del
ren %windir%\System32\drivers\etc\hosts_temp hosts
del %windir%\System32\drivers\etc\hosts_temp_del /s /q

echo. >>%windir%\System32\drivers\etc\hosts
echo %CU%|findstr "1" >nul && call :googlesrv
echo %CU%|findstr "2" >nul && call :antiad
echo %CU%|findstr "3" >nul && call :YouTube
echo %CU%|findstr "4" >nul && call :twfb
echo %CU%|findstr "5" >nul && call :dropbox

:googlesrv
echo #HAC_hosts START>>%windir%\System32\drivers\etc\hosts
echo.>>%windir%\System32\drivers\etc\hosts
echo #HAC_Google Services START>>%windir%\System32\drivers\etc\hosts
echo 203.208.46.180	www.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	talk.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	talkgadget.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	groups.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	talkx.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	themes.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	market.android.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	toolbar.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	0-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	0.gvt0.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	0.gvt0.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	1.gvt0.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	1.gvt0.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	2.gvt0.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	2.gvt0.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	3.gvt0.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	4.gvt0.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	4.gvt0.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	5.gvt0.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	3hdrrlnlknhi77nrmsjnjr152ueo3soc-a-calendar-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	53rd6p0catml6vat6qra84rs0del836d-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	59cbv4l9s05pbaks9v77vc3mengeqors-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	8kubpeu8314p2efdd7jlv09an9i2ljdo-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	accounts.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	adstvca8k2ooaknjjmv89j22n9t676ve-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ajax.googleapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	apis.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks0.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks1.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks2.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks3.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks4.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks5.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks6.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks7.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks8.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bks9.books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	blogsearch.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mail.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.gmail.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	blogsearch.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	books.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	apps.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	appengine.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	browserchannel-docs.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	browserchannel-spreadsheets.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	browsersync.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bt26mravu2qpe56n8gnmjnpv2inl84bf-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cache.pack.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	calendar.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	chrome.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients1.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients2.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients3.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients4.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients4.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients5.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients5.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients6.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients6.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients7.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients7.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	code.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	csi.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	desktop.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	desktop2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ditu.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	dl.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	domains.googlesyndication.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	earth.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	encrypted.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	encrypted.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	encrypted-tbn0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	encrypted-tbn1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	encrypted-tbn2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	encrypted-tbn3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	feedback.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	feedburner.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	feedproxy.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	feeds.feedburner.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	finance.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	fonts.googleapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	g0.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	gg.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ghs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ghs.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	googlehosted.l.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	id.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	id.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	id.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images0-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	i8brh95qor6r54nkl52hidj2ggcs4jgm-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images1-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images2-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images3-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images4-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images5-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images6-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images-lso-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images-pos-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	k6v18tjr24doa89b55o3na41kn4v73eb-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khm.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	labs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	large-uploads.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh1.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh1.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh2.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh2.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh3.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh3.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh4.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh4.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh5.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh5.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh6.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh6.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	maps.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	maps.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	maps-api-ssl.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	music.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	music.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	music-streaming.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mw2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	news.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	newsfeed-dot-latest-dot-rovio-ad-engine.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt0.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt1.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt2.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt3.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	oauth.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ode25pfjgmvpquh3b1oqo31ti5ibg5fr-a-calendar-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ob7f2qc0i50kbjnc81vkhgmb5hsv7a8l-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	picasa.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	picasaweb.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	picasaweb.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	places.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	plus.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	plus.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	plusone.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	profiles.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	project-slingshot-gp.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	video.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	voice.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	webcache.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	wenda.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	writely.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.google-analytics.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.googleadservices.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	writely-china.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.googleapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.googlelabs.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-calendar-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	goto.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	wire.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	picasaweb.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	desktop.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	jmt0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	id.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	id.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	id.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.gstatic.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	stat.top100.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	audio.top100.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	audio2.top100.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	music.googleusercontent.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www0.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www1.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www2.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www3.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www4.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	suggestqueries.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	suggestqueries.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients1.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients1.google.com.tw #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	linkhelp.clients.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	encrypted-tbn.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ghs46.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ghs46.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	appspot.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	gv-gadget.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	googlesharedspaces.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	blogsearch.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	browsersync.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	toolbarqueries.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	toolbarqueries.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	chrome.angrybirds.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.google-analytics.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r2303.latest.project-slingshot-hr.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	code.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	googlecode.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	chromium.googlecode.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	earth-api-samples.googlecode.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	gmaps-samples-flash.googlecode.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	google-code-feed-gadget.googlecode.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	closure-library.googlecode.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	desktop.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	desktop.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs4.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs5.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs6.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs7.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs8.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	docs9.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	0.docs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	1.docs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	2.docs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	3.docs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	4.docs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	5.docs.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	spreadsheets-china.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	writely-com.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	dl.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	dl.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	dl-ssl.google.com #HAC >>%windir%\System32\drivers\etc\
echo %IP%	spreadsheets.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	earth.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	auth.keyhole.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	geoauth.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mars.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	local.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	map.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	maps.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	kh.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	kh.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khmdb.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khm.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khm0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khm1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khm2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khm3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbk0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbk1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbk2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbk3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbks0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbks1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbks2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	cbks3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	khms.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mw1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mw2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	gg.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	csi.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	id.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ditu.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt0.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt1.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt2.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt3.google.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts3.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mts.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	maps.gstatic.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mobilemaps.clients.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt0.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt1.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt2.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt3.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt4.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	nt5.ggpht.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	photos.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	picasaweb.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	picasa.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh2.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	photos-ugc.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	wifi.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	wifi.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t0.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t1.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t2.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t3.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	g0.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	g1.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	g2.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	g3.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt0.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt1.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt2.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt3.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt4.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt5.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt6.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	mt7.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	chart.apis.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	googleapis.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	chart.googleapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	fonts.googleapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	maps.googleapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	translate.googleapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	googleapis-ajax.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	googleapis-ajax.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r3085-dot-latest-dot-project-slingshot-gp.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r3091-dot-latest-dot-project-slingshot-gp.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r3101-dot-latest-dot-project-slingshot-gp.appspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r70rmsn4s0rhk6cehcbbcbfbs31pu0va-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r8.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r9.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	rbjhe237k979f79d87gmenp3gejfonu9-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s.ytimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s1.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s2.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s2.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s3.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s4.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s5.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	s6.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	safebrowsing.clients.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	safebrowsing-cache.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	sandbox.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	sb.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	scholar.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	scholar.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	services.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	sites.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	sketchup.google.com #HAC>>%windir%\System32\drivers\etc\hosts

echo %IP%	spreadsheet.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	spreadsheets.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	spreadsheets0.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	spreadsheets1.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	spreadsheets2.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ssl.google-analytics.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ssl.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	suggestqueries.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t0.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t1.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t2.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t3.gstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	t.doc-0-0-sj.sj.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	blogger.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	doc-00-7o-docs.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	doc-08-7o-docs.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	doc-0c-7o-docs.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	doc-0g-7o-docs.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	doc-0s-7o-docs.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	doc-10-7o-docs.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	doc-14-7o-docs.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	feedback.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	lh0.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	music-onebox.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	static.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	themes.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	translate.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	code-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	spreadsheets-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images-docs-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-gm-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-opensocial-sandbox.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-fc-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images0-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images7-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images8-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images9-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	0-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	1-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	2-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	3-focus-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-kix-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-onepick-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	images-onepick-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www-open-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	0-open-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	1-open-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	2-open-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	3-open-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	4fjvqid3r3oq66t548clrdj52df15coc-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	debh8vg7vd93bco3prdajidmm7dhql3f-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	hsco54a20sh11q9jkmb51ad2n3hmkmrg-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	qhie5b8u979rnch1q0hqbrmbkn9estf7-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	bt26mravu2qpe56n8gnmjnpv2inl84bf-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	rbjhe237k979f79d87gmenp3gejfonu9-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	k6v18tjr24doa89b55o3na41kn4v73eb-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	8kubpeu8314p2efdd7jlv09an9i2ljdo-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	adstvca8k2ooaknjjmv89j22n9t676ve-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ob7f2qc0i50kbjnc81vkhgmb5hsv7a8l-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	53rd6p0catml6vat6qra84rs0del836d-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	u807isd5egseeabjccgcns005p2miucq-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r70rmsn4s0rhk6cehcbbcbfbs31pu0va-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	59cbv4l9s05pbaks9v77vc3mengeqors-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	i8brh95qor6r54nkl52hidj2ggcs4jgm-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	upt14k1i2veesusrda9nfotcrbp9d7p5-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	debh8vg7vd93bco3prdajidmm7dhql3f-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	4fjvqid3r3oq66t548clrdj52df15coc-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	hsco54a20sh11q9jkmb51ad2n3hmkmrg-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	qhie5b8u979rnch1q0hqbrmbkn9estf7-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	toolbarqueries.clients.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	toolbarqueries.google.com.hk #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tools.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	translate.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	u807isd5egseeabjccgcns005p2miucq-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	uploadsj.clients.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	upt14k1i2veesusrda9nfotcrbp9d7p5-a-oz-opensocial.googleusercontent.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	goo.gl #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	g.co #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	autoproxy-gfwlist.googlecode.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	video-stats.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ytstatic.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	static.cache.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	accounts.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	magnifier.blogspot.com #HAC>>%windir%\System32\drivers\etc\hosts
echo #HAC_Google Services END>>%windir%\System32\drivers\etc\hosts
echo %CU%|findstr "2" >nul && call :antiad
echo %CU%|findstr "3" >nul && call :YouTube
echo %CU%|findstr "4" >nul && call :twfb
echo %CU%|findstr "5" >nul && call :dropbox
goto done

:antiad
echo.>>%windir%\System32\drivers\etc\hosts
echo #HAC_AntiAD START>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 analytics.ws.126.net img1.126.net img2.126.net adc.163.com adclient.163.com adgeo.163.com adimg.163.com allyes.nie.163.com analytics.163.com cpc.163.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 corp.163.com pro.163.com proimg.163.com union.163.com ht.hao120.cc #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad4.sina.com.cn adsina.allyes.com beacon.sina.com.cn classadnew.sina.com.cn click.sina.com.cn counter.sina.com.cn sina.allyes.com sinasc.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 d1.sina.com.cn d2.sina.com.cn d3.sina.com.cn d4.sina.com.cn d5.sina.com.cn dcads.sina.com.cn pfp.sina.com.cn pfpip.sina.com pfpclick.sina.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 api.ads.vip.cnh.yahoo.com cm.p4p.cn.yahoo.com cn.adserver.yahoo.com cn.promo.yahoo.com cn.rd.yahoo.com new.rd.cn.yahoo.com union.yahoo.com.cn yui.yahooapis.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ads.yimg.com richmedia.yimg.com ts.richmedia.yahoo.com us.ard.yahoo.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.yieldmanager.com content.yieldmanager.com content.yieldmanager.edgesuite.net mi.adinterax.com tr.adinterax.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 adclick.bai.sohu.com cpc.sohu.com doc.go.sohu.com ip.cms.sohu.com partner.search.sohu.com pv.sohu.com scalink.sohu.com suvset.sohu.com txt.go.sohu.com  #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 imp.ad-plus.cn sohu.ad-plus.cn u.ad-plus.cn sohusc.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ads1.msn.com ads2.msads.net analytics.live.com analytics.msn.com c.msn.com rad.msn.com msnportal.112.2o7.net msn.allyes.com msnms.allyes.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 801.tianya.cn 802.tianya.cn 803.tianya.cn 806.tianya.cn adview.tianya.cn advertisement.tianya.cn stat.tianya.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 gg.mop.com in.dg.mop.com in.h.mop.com in.sg.mop.com in.sh.mop.com ovsmbt.mop.com p4pad.mop.com pub.mop.com stat.ent.mop.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 tj.itv.mop.com tj.mop.com tj.pet.mop.com union.mop.com yx.mop.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 click.jebe.renren.com cupid.jebe.renren.com shaft.jebe.renren.com jebe.renren.com jebe.xnimg.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.xici.net afpxici.allyes.com xiciafp.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0	aimg.qihoo.com clkstat.qihoo.com rd.qikoo.com code.qihoo.com qd.code.qihoo.com union.qihoo.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 analytics.21cn.com click.21cn.com market.21cn.com ranking.21cn.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.tom.com sc.tom.com tom.allyes.com xtrack.tomonline-inc.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 pic.fengniao.com stat.fengniao.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 adc.yidaba.com adfv.yidaba.com adj.yidaba.com adv.yidaba.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 d.5d6d.com un.5d6d.com v3.apic.51.com union.daqi.com union.phpwind.com jj.topzj.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ads.wopus.org adv.blogupp.com union.bolaa.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 adm.zol.com.cn bwp.zol.com.cn jspchome.zol.com.cn pv.zol.com.cn pvpchome.zol.com.cn pvsite.zol.com.cn stat.zol.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 11.mydrivers.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.pchome.net btm.pchome.net btn.pchome.net stat.pchome.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 33.pcpop.com count.pcpop.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 adv.pconline.com.cn count5.pconline.com.cn imgad1.3conline.com imgad2.3conline.com ivy.pconline.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 yahoo1.beareyes.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 media.yesky.com ucpn.yesky.com union.yesky.com yeskyafp.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 e.akamai.net stat.ccidnet.com www2.ccidnet.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 am.zdnet.com.cn pv.zdnet.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.ddvip.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 apic.xiyuit.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 pic.ea3w.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 clkservice.youdao.com clkservice2.dict.youdao.com impservice.union.youdao.com impservice.youdao.com shared.ydstatic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 goto.www.iciba.com u.iciba.com u.sl.iciba.com u.www.duba.net union.jx2.kingsoft.com union.kingsoft.com union.wps.kingsoft.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 counter.csdn.net z.csdn.net zi.csdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 gg.donews.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 trace.enet.com.cn enet4.enet.com.cn altfarm.mediaplex.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 adshow.it168.com 168.it168.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 img.rayfile.com raya.rayfile.com w105.rayfile.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 techweb.adsame.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 d1.xcar.com.cn d0.xcar.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 33.autohome.com.cn allyesbjafa.allyes.com ebooafa7.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 analyze.cheshi.com click.cheshi.com media.cheshi-img.com pv.cheshi.com fallyesbjafa.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 g.bitauto.com gimg.bitauto.com ip.bitauto.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 chinacarsafp.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 al.7pk.com client.7pk.com imgcache.7pk.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 allyes.the9.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 bmp.ali213.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 g.webgame.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 gg.cdcgames.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 stat.uuu9.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 market.duowan.com mstat.duowan.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 bill.tgbus.com g.tgbus.com g.tgbusdata.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.16wan.com bto.youxiya.com c.91wan.com dev.tongxue.com doc.70yx.com g.91sanguo.cn images.9zwar.com passport.fs5d.com tao.37wan.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 tg.70yx.com u.56wan.com u.7town.com u.molidao.com uimg.my4399.com unigg.kunlun.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.17k.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 img.a.07073.com image.86661.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ad.cmfu.com cj.qidian.com ploy.qidian.com uedas.qidian.com resource.igalive.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 images2.zhulang.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 static.atm.youku.com static.lstat.youku.com vid.atm.youku.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 adextensioncontrol.tudou.com adplay.tudou.com iwstat.tudou.com nstat.tudou.com stat.tudou.com stats.tudou.com 888.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 analytics.ku6.com stat1.888.ku6.com stat2.888.ku6.com stat3.888.ku6.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 86file.megajoy.com 86get.joy.cn 86log.joy.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 cast.ra.icast.cn js.icast.cn kw.ra.icast.cn post.ra.icast.cn pre.ra.icast.cn pv.ra.icast.cn rm.ra.icast.cn track.ra.icast.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 autou.vodone.cn bus.vodone.com busjs.vodone.cn cai.vodone.com ego.vodone.com images.vodone.com pic.vodone.com stat.vodone.cn stat2.vodone.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 u.vodone.com u3.vodone.com uflv.vodone.com v.vodone.com vlog.vodone.com vodone.com www.vodone.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 acs.56.com bill.agent.56.com union.56.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 simba.6.cn pole.6rooms.com shrek.6.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 m.openv.tv uniclick.openv.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 union.pomoho.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 jsunion.boodvd.cn jsunion.boodvd.com union.boodvd.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ay.eastmoney.com same.eastmoney.com g1.dfcfw.com eastmoney.allyes.com wonderadafa7.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 allyes.jrj.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 allyes.stockstar.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 click.cnfol.com wanmoafa7.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 xc.macd.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 analytics.tool.hexun.com hx.hexun.com itv.hexun.com union.hexun.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 a.emedia.cn fun.ynet.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 a4.yeshj.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 app-g.39.net dpvc.39.net dy.39.net 39net.datamaster.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 clickn.soufun.com flas.soufun.com imgd.soufun.com imgdn.soufun.com show.soufun.com shows1.soufun.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 sc.ifeng.com sta.ifeng.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ads.tiexue.net x.itiexue.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ads.zaobao.com lhzbafp.allyes.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 a.cctv.com ad.cctv.com cctv.adsunion.com adguanggao.eee114.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 ads.people.com.cn pro.people.com.cn #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 adcenter.xinhuanet.com embed.xinhuanet.com entity.xinhuanet.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 0.0.0.0 dvs.china.com dvsend.china.com #HAC>>%windir%\System32\drivers\etc\hosts
echo #HAC_AntiAD END>>%windir%\System32\drivers\etc\hosts
echo %CU%|findstr "3" >nul && call :YouTube
echo %CU%|findstr "4" >nul && call :twfb
echo %CU%|findstr "5" >nul && call :dropbox
goto done

:YouTube
echo.>>%windir%\System32\drivers\etc\hosts
echo #HAC_YouTube START>>%windir%\System32\drivers\etc\hosts

echo %IP%	apiblog.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	clients1.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	gdata.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	help.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	i1.ytimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	i2.ytimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	i3.ytimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	i4.ytimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	insight.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	m.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v1.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v10.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v11.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v12.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v13.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v14.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v15.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v16.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v17.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v18.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v19.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v2.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v20.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v21.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v22.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v23.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v24.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v3.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v4.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v5.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v6.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v7.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v8.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	o-o.preferred.sjc07s15.v9.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r1.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r10.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r11.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r12.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r13.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r14.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r15.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r16.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r17.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r18.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r19.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r2.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r20.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r21.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r22.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r23.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r24.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r3.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r4.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r5.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r6.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r7.pek01s01.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts

echo %IP%	tc.v1.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	au.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ca.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	de.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	fr.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	jp.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ru.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	uk.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tw.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ads.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	www.youtube-nocookie.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	youtube-ui.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	youtube-ui-china.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	youtu.be #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	stage.gdata.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	img.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	upload.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.nonxt8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v1.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v2.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v3.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v4.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v5.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v6.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v7.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v8.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v9.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v10.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v11.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v12.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v13.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v14.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v15.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v16.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v17.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v18.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v19.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v20.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v21.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v22.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v23.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	tc.v24.lscache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v1.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v2.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v3.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v4.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v5.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v6.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v7.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v8.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v9.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v10.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v11.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v12.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v13.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v14.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v15.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v16.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v17.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v18.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v19.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v20.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v21.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v22.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v23.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache1.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache2.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache3.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache4.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache5.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache6.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache7.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	v24.cache8.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r1.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r1.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r2.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r2.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r3.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r3.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r4.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r4.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r5.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r5.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r6.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r6.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r7.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r7.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r8.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r8.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r9.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r9.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r10.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r10.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r11.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r11.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r12.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r12.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r13.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r13.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r14.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r14.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r15.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r15.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r16.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r16.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r17.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r17.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r18.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r18.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r19.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r19.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r20.tpe05s03.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	r20.tpe05s04.c.youtube.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	ytimg.l.google.com #HAC>>%windir%\System32\drivers\etc\hosts
echo %IP%	i.ytimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo #HAC_Youtube END>>%windir%\System32\drivers\etc\hosts
echo %CU%|findstr "4" >nul && call :twfb
echo %CU%|findstr "5" >nul && call :dropbox
goto done

:twfb
echo.>>%windir%\System32\drivers\etc\hosts
echo #HAC_Facebook START>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.16	facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.16	www.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.31	m.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.20	login.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.57	secure.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 66.220.146.18	apps.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.31	touch.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 118.214.114.110	s-static.ak.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 66.220.147.47	api.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.16	zh-CN.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.98	static.ak.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.98	b.static.ak.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.57	secure-profile.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.57	secure-media-sf2p.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.15	ssl.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.190.18	apps.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 118.214.190.105	profile.ak.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 97.65.135.139	external.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 120.29.145.50	vthumb.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 97.65.135.163	static.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.181.16	graph.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.120	b.static.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	creative.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.114	profile.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	s-hprofile-sf2p.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	photos-a.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	photos-b.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	photos-c.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	photos-d.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	photos-e.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.98	photos-f.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	photos-g.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 61.213.189.113	photos-h.ak.fbcdn.net #HAC>>%windir%\System32\drivers\etc\hosts
echo 69.63.180.51	upload.facebook.com #HAC>>%windir%\System32\drivers\etc\hosts
echo #HAC_Facebook END>>%windir%\System32\drivers\etc\hosts
echo.>>%windir%\System32\drivers\etc\hosts
echo #HAC_Twitter START>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.210	t.co #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	upload.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	pic.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	oauth.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	www.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	mobile.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	api.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	search.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.148.139	userstream.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	ssl.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	status.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	assets0.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	assets1.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	assets2.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	assets3.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.243	static.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 184.29.36.124	platform.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 219.76.10.138	platform0.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.148.206	help.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.148.206	support.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.84.4.102	si0.twimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.84.4.102	si1.twimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.84.4.102	si2.twimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.84.4.102	si3.twimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.84.4.102	si4.twimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.84.4.102	si5.twimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.84.4.102	si5.twimg.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.148.243	scribe.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.148.138	betastream.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 184.106.20.99	posterous.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.144	oi40.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi41.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi42.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi43.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi44.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi45.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi46.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi47.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi48.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi49.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.143	oi50.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.144	oi51.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.144	oi52.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.144	oi53.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.144	oi54.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.144	oi55.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 209.17.70.144	oi56.tinypic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.58.234	twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.58.234	www.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.46.32	web7.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.58.204	web1.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.58.224	web2.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.58.200	web3.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.37.33.184	web4.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.37.75.16	web5.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.35.60	web6.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 66.228.120.92	web8.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 74.86.100.160	web9.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 74.86.87.236	web10.twitpic.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 208.94.0.61	a.yfrog.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 208.94.0.61	yfrog.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 208.94.0.61	www.yfrog.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.59.149.208	scribe.twitter.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 208.87.33.151	api.mobilepicture.com #HAC>>%windir%\System32\drivers\etc\hosts
echo #HAC_Twitter END>>%windir%\System32\drivers\etc\hosts
echo %CU%|findstr "5" >nul && call :dropbox

:dropbox
echo.>>%windir%\System32\drivers\etc\hosts
echo #HAC_Dropbox START>>%windir%\System32\drivers\etc\hosts
echo 199.47.217.179	dropbox.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 199.47.217.170	www.dropbox.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 50.16.237.97	dl.dropbox.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 50.16.237.97	dl-web.dropbox.com #HAC>>%windir%\System32\drivers\etc\hosts
echo 174.36.51.42	forums.dropbox.com #HAC>>%windir%\System32\drivers\etc\hosts
echo #HAC_Dropbox END>>%windir%\System32\drivers\etc\hosts
goto done


:done

echo #HAC_hosts END>>%windir%\System32\drivers\etc\hosts
ipconfig /flushdns
cls
echo.
echo.
echo.

echo ����hosts�༭���.
echo.
echo.

echo Google+��Twitter��Facebook��Ҫ��HTTPS��ʽ���ʡ���ַ�ǣ�
echo https://plus.google.com
echo https://www.twitter.com
echo https://www.facebook.com
echo.
pause

goto exit

:remove
cls
if exist "%windir%\System32\drivers\etc\hosts_hpbak" (goto removeit) else echo �����ļ������ڡ���֮ǰж�ع��˰ɣ�
goto begin

:delchar
type %windir%\System32\drivers\etc\hosts|find "#THISISNOTE" /i /v|find "#HAC" /i /v|find "#HostsAutoChanger" /i /v|find "#HWrite" /i /v|findstr ".">>%windir%\System32\drivers\etc\hosts_temp
ren %windir%\System32\drivers\etc\hosts hosts_temp_del
ren %windir%\System32\drivers\etc\hosts_temp hosts
del %windir%\System32\drivers\etc\hosts_temp_del /s /q
del %windir%\System32\drivers\etc\hosts_hpbak /s /q
del %windir%\System32\drivers\etc\hosts#THISISNOTE /s /q
del %windir%\System32\drivers\etc\hosts.tw /s /q
del %windir%\System32\drivers\etc\hosts_temp /s /q
goto begin

:removeit
ren %windir%\System32\drivers\etc\hosts hosts_del
ren %windir%\System32\drivers\etc\hosts_hpbak hosts
cls
del %windir%\System32\drivers\etc\hosts_del /s /q
del %windir%\System32\drivers\etc\hosts_hpbak /s /q
del %windir%\System32\drivers\etc\hosts_temp /s /q
goto tools

:edithosts
start %windir%\notepad.exe %windir%\system32\drivers\etc\hosts
cls
goto tools


:exit
REM takeown /a /f %windir%\System32\drivers\etc\hosts
attrib %windir%\System32\drivers\etc\hosts +s +r
REM echo y|cacls %windir%\System32\drivers\etc\hosts /g everyone:r
del temp.bat /s /q
del %windir%\System32\drivers\etc\hosts#THISISNOTE /s /q
del %windir%\System32\drivers\etc\hosts.tw /s /q
del %windir%\System32\drivers\etc\hosts_temp /s /q
exit

REM ��������ѭ ��������Э�� ����-��ͬ��ʽ����Э����
REM ���������Ϣ����ʣ�http://creativecommons.org/licenses/by-sa/2.5/cn/
REM Original version: https://plus.google.com/u/1/102216617437795883914/posts/iYS8CCubLTU