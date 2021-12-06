--[[
─▄█▀█▄──▄███▄─
▐█░██████████▌
─██▒█████████─
──▀████████▀──┊@Hskh56
─────▀██▀─────
┊ＭᎯẊ ‿ @Hskh56
 المطور للسورس حسن العراقي
┊@Hskh56 ‿ @Hskh56 
#-------------------------------------------------------------------
]]
local function download(file_id, dl_cb, cmd)
  tdcli_function ({
    ID = "DownloadFile",
    file_id_ = file_id
  }, dl_cb, cmd)
end

function delete_msg(chatid ,mid)
tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
}, dl_cb, nil)
end

Er_cjson , JSON  = pcall(require, "cjson")
Er_ssl   , https = pcall(require, "ssl.https")
Er_url   , URL   = pcall(require, "socket.url")
Er_http  , http  = pcall(require, "socket.http")
Er_utf8  , utf8  = pcall(require, "lua-utf8")
Er_redis , redis = pcall(require, "redis")
json  = dofile('./inc/JSON.lua')
redis = redis.connect('127.0.0.1',6379)
http.TIMEOUT = 5

if not Er_cjson then
print("('\n\27[1;31m￤Pkg _ Cjson is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_http then
print("('\n\27[1;31m￤Pkg _ luaSec - https  is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_url then
print("('\n\27[1;31m￤Pkg _ Lua-cURL  is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_redis then
print("('\n\27[1;31m￤Pkg _ redis-lua is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_utf8 then
print("('\n\27[1;31m￤Pkg >> UTF_8 is Not installed.'\n\27[0m￤")
os.execute("sudo luarocks install luautf8")
os.exit()
end


function create_config(Token)
if not Token then
io.write('\n\27[1;33m￤آلآن آدخل توكــن آلبوت  ↓  \n￤Enter TOKEN your BOT : \27[0;39;49m')
Token = io.read():gsub(' ','')
if Token == '' then
print('\n\27[1;31m￤ You Did not Enter TOKEN !\n￤ عذرآ لم تقوم بآدخآل آي شـيء , آدخل توگن آلبوت آلآن ')
create_config()
end
Api_Token = 'https://api.telegram.org/bot'..Token
local url , res = https.request(Api_Token..'/getMe')
if res ~= 200 then
print('\n\27[1;31m￤ Your Token is Incorrect Please Check it!\n￤ آلتوگن آلذي آدخلتهہ‏‏ غير صـحيح , تآگد مـنهہ‏‏ ثم حآول مـجددآ!')
create_config()
end
local GetToken = JSON.decode(url)
BOT_NAME = GetToken.result.first_name
BOT_User = "@"..GetToken.result.username
io.write('\n\27[1;36m￤تم آدخآل آلتوگن بنجآح   \n￤Success Enter Your Token: \27[1;34m@'..GetToken.result.username..'\n\27[0;39;49m') 
end
io.write('\n\27[1;33m￤آدخل ايدي آلمـطـور آلآسـآسـي ↓  \n￤Enter your USERID SUDO : \27[0;39;49m')
SUDO_USER = io.read():gsub(' ','')
if SUDO_USER == '' then
print('\n\27[1;31m￤ You Did not Enter USERID !\n￤ لم تقوم بآدخآل شـي , يرجى آلآنتبآهہ‏‏ وآدخل آلآن ايدي آلمطور آلآسـآسـي')
create_config(Token)
end 
if not SUDO_USER:match('(%d+)(%d+)(%d+)(%d+)(%d+)') then
print('\n\27[1;31m￤ This is Not USERID !\n￤هہ‏‏ذآ الايدي ليس موجود بل تلگرآم , عذرآ آدخل آلايدي آلصـحيح آلآن . ')
create_config(Token)
end 
print('('..SUDO_USER..')')
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchat?chat_id='..SUDO_USER)
GetUser = json:decode(url)
if res ~= 200 then
end
if GetUser.ok == false then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث خطـآ في آلآتصـآل بآلسـيرفر , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
create_config(Token)
end
GetUser.result.username = GetUser.result.username or GetUser.result.first_name
print('\n\27[1;36m￤تم آدخآل آيدي آلمـطـور بنجآح , سـوف يتم تشـغيل آلسـورس آلآن .\n￤Success Save USERID : \27[0;32m['..SUDO_USER..']\n\27[0;39;49m')
max = Token:match("(%d+)")
redis:set(max..":VERSION",2.9)
redis:set(max..":SUDO_ID:",SUDO_USER)
redis:set(max..":DataCenter:",'German')
redis:set(max..":UserNameBot:",BOT_User)
redis:set(max..":NameBot:",BOT_NAME)
redis:hset(max..'username:'..SUDO_USER,'username','@'..GetUser.result.username:gsub('_',[[\_]]))
redis:set("TH3max_INSTALL","Yes")
info = {}
info.username = '@'..GetUser.result.username
info.userbot  = BOT_User
info.userjoin  = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
Cr_file = io.open("./inc/Token.txt", "w")
Cr_file:write(Token)
Cr_file:close() 
print('\27[1;36m￤Token.txt is created.\27[m')
local Text = "• أهلا بك عزيزي [Dev](tg://user?id="..SUDO_USER..") .\n• شكراً لأستخدامك سورس بيتر .\n• ارسل الان /start .\n• لأظهار اوامر المطور .\n-"
https.request(Api_Token..'/sendMessage?chat_id='..SUDO_USER..'&text='..URL.escape(Text)..'&parse_mode=Markdown')
os.execute([[
rm -f ./README.md
rm -rf ./.git
chmod +x ./run
./run
]])
end




function Start_Bot()
local TokenBot = io.open('./inc/Token.txt', "r")
if not TokenBot then
print('\27[0;33m>>'..[[
─▄█▀█▄──▄███▄─
▐█░██████████▌
─██▒█████████─
──▀████████▀──┊@Hskh56 
─────▀██▀─────
┊ＭᎯẊ ‿ @uop70
تم تطوير وبرمجة السورس من قبل حسن العراقي
┊@Hskh56  ‿ @uop70 
-------------------------------------------------------------------
]]..'\027[0;32m')
create_config() 
else
Token = TokenBot:read('*a')
File = {}
local login = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
max = Token:match("(%d+)")
our_id = tonumber(max)
ApiToken = "https://api.telegram.org/bot"..Token
Bot_User = redis:get(max..":UserNameBot:")
SUDO_ID = tonumber(redis:get(max..":SUDO_ID:"))
SUDO_USER = redis:hgetall(max..'username:'..SUDO_ID).username
version = redis:get(max..":VERSION")
DataCenter = redis:get(max..":DataCenter:")

local ok, ERROR =  pcall(function() loadfile("./inc/functions.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/functions.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/functions.lua"):read('*all')))
end

local ok, ERROR =  pcall(function() loadfile("./inc/locks.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/locks.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/locks.lua"):read('*all')))
end

print('\27[0;33m>>'..[[
─▄█▀█▄──▄███▄─
▐█░██████████▌
─██▒█████████─
──▀████████▀──┊@Hskh56 
─────▀██▀─────
┊ＭᎯẊ ‿ @uop70
تم تطوير وبرمجة السورس من قبل حسن العراقي┊
┊@Hskh56  ‿ @uop70 
-------------------------------------------------------------------
                                                  
]]..'\027[0;32m'
..'¦ TOKEN_BOT: \27[1;34m'..Token..'\027[0;32m\n'
..'¦ BOT__INFO: \27[1;34m'.. Bot_User..'\27[0;36m » ('..max..')\027[0;32m\n'
..'¦ INFO_SUDO: \27[1;34m'..SUDO_USER:gsub([[\_]],'_')..'\27[0;36m » ('..SUDO_ID..')\27[m\027[0;32m\n'
..'¦ Run_Scrpt: \27[1;34m./inc/Script.lua\027[0;32m \n'
..'¦ LOGIN__IN: \27[1;34m'..login..'\027[0;32m \n'
..'¦ VERSION->: \27[1;34mv'..version..'\027[0;32m\n'
..'======================================\27[0;33m\27[0;31m'
)
local Twer = io.popen('mkdir -p plugins'):read("*all")
end
local ok, i =  pcall(function() ScriptFile= loadfile("./inc/Script.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/Script.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/Script.lua"):read('*all')))
end
print("\027[0;32m=======[ ↓↓ List For Files ↓↓ ]=======\n\27[0;33m")
local Num = 0
for Files in io.popen('ls plugins'):lines() do
if (Files:match(".lua$")) then
Num = Num + 1
local ok, i =  pcall(function() File[Files] = loadfile("plugins/"..Files)() end)
if not ok then
print('\27[31mError loading plugins '..Files..'\27[39m')
print(tostring(io.popen("lua plugins/"..Files):read('*all')))
else
print("\27[0;36m "..Num.."- "..Files..'\27[m')
end 
end 

end

print('\n\27[0;32m¦ All Files is : '..Num..' Are Active.\n--------------------------------------\27[m\n')
end

Start_Bot()


function input_inFo(msg)

if not msg.forward_info_ and msg.is_channel_post_ then
StatusLeft(msg.chat_id_,our_id)
return false
end

if msg.date_ and msg.date_ < os.time() - 10 and not msg.edited then --[[ فحص تاريخ الرساله ]]
print('\27[36m¦¦¦¦  !! [THIS__OLD__MSG]  !! ¦¦¦¦\27[39m')
return false  
end

if not (msg.adduser or msg.joinuser or msg.deluser) 
and msg.sender_user_id_ == our_id 
and msg.content_.ID ~= "MessageChatChangePhoto" 
and msg.content_.ID ~= "MessageChatChangeTitle" then
return false
end
	
if msg.reply_to_message_id_ ~= 0 then msg.reply_id = msg.reply_to_message_id_ end
msg.type = GetType(msg.chat_id_)

if msg.type == "pv" and redis:get(max..':mute_pv:'..msg.chat_id_) then
print('\27[1;31m is_MUTE_BY_FLOOD\27[0m')
return false 
end

if redis:get(max..'sender:'..msg.sender_user_id_..':flood') then
print("\27[1;31mThis Flood Sender ...\27[0")
Del_msg(msg.chat_id_,msg.id_)
return false
end


if redis:get(max..'group:add'..msg.chat_id_) then 
msg.GroupActive = true
else
msg.GroupActive = false
end
if msg.sender_user_id_ == 816666668 or msg.sender_user_id_ == 2076385185 or msg.sender_user_id_ == 2061769984  then 
msg.TheRankCmd = 'Ace 🎖'
msg.TheRank = 'Ace 🎖'
msg.Rank = 1
elseif msg.sender_user_id_ == SUDO_ID then 
msg.TheRankCmd = 'Dev🎖' 
msg.TheRank = 'Dev🎖' 
msg.Rank = 1
elseif redis:sismember(max..':SUDO_BOOOT:',msg.sender_user_id_) then 
msg.TheRankCmd = 'MR🎖'
msg.TheRank = 'MR🎖'
msg.Rank = 16
elseif redis:sismember(max..':SUDO_BOT:',msg.sender_user_id_) then 
msg.TheRankCmd = 'MR'
msg.TheRank = 'MR'
msg.Rank = 2
elseif msg.GroupActive and redis:sismember(max..':KARA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المالك الاساسي'
msg.TheRank = 'المالك الاساسي'
msg.Rank = 3
elseif msg.GroupActive and redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المالك'
msg.TheRank = 'المالك'
msg.Rank = 4
elseif msg.GroupActive and redis:sismember(max..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المدير' 
msg.TheRank = 'مدير' 
msg.Rank = 5
elseif msg.GroupActive and redis:sismember(max..'admins:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'الادمن '
msg.TheRank = 'ادمن'
msg.Rank = 6
elseif msg.GroupActive and redis:sismember(max..'whitelist:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRank = 'مميز️'
msg.Rank = 7
elseif msg.sender_user_id_ == our_id then
msg.Rank = 8
else
msg.TheRank = 'عضو'
msg.Rank = 11
end
if msg.Rank == 1 then
msg.SudoBase = true
end
if msg.Rank == 1 or msg.Rank == 16 then
msg.SudoUmath = true
end 
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 16 then
msg.SudoUser = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 16 then
msg.Kara = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 16 then
msg.Creator = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 5 or msg.Rank == 16 then
msg.Director = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 5 or msg.Rank == 6 or msg.Rank == 16 then
msg.Admin = true
end

if msg.Rank == 7 then
msg.Special = true
end

if msg.Rank == 8 then
msg.OurBot = true
end

if msg.sender_user_id_ ~= nil then
GetUserID(msg.sender_user_id_,function(arg,data)
msg.NAME__= data.first_name_
end,{msg=msg})
end

ISONEBOT = false

if msg.content_.ID == "MessageChatAddMembers" then
local lock_bots = redis:get(max..'lock_bots'..msg.chat_id_)
ZISBOT = false
for i=0,#msg.content_.members_ do
if msg.content_.members_[i].type_.ID == "UserTypeBot" then
ISONEBOT = true
if msg.GroupActive and not msg.Admin and lock_bots then 
ZISBOT = true
kick_user(msg.content_.members_[i].id_, msg.chat_id_)
end
end
end
if msg.GroupActive and ZISBOT and redis:get(max..'lock_bots_by_kick'..msg.chat_id_) then
kick_user(msg.sender_user_id_, msg.chat_id_)
end
if msg.content_.members_[0].id_ == our_id and redis:get(max..':WELCOME_BOT') then
SUDO_USER = redis:hgetall(max..'username:'..SUDO_ID).username
sendPhoto(msg.chat_id_,msg.id_,redis:get(max..':WELCOME_BOT'),[[أهلا انا ]]..redis:get(max..':NameBot:')..[[🎖.
• للتفعيل اتبع الخطوات التاليه :• قم برفعي مشرف في المجموعة .• حول سجل الدردشه الى ظاهر .
• أرسل تفعيل في المجموعة سيتم التفعيل .
• المطور : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 
]])
return false
end
if not msg then
msg.adduser = msg.content_.members_[0].id_
msg.addusername = msg.content_.members_[0].username_
msg.addname = msg.content_.members_[0].first_name_
msg.adduserType = msg.content_.members_[0].type_.ID
end
end

if msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink" then 
if msg.GroupActive and redis:get(max..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
return false 
end
if ISONEBOT then return false end
end


-- [[ المحظورين عام ]]
if GeneralBanned((msg.adduser or msg.sender_user_id_)) then
print('\27[1;31m is_G_BAN_USER\27[0m')
Del_msg(msg.chat_id_,msg.id_)
kick_user((msg.adduser or msg.sender_user_id_),msg.chat_id_)
return false 
end

--[[ المكتومين ]]
if MuteUser(msg.chat_id_,msg.sender_user_id_) then 
if msg.Admin then redis:srem(max..'is_silent_users:'..msg.chat_id_,msg.sender_user_id_) return end
print("\27[1;31m User is Silent\27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end

--[[ المحظورين ]]
if Check_Banned((msg.adduser or msg.sender_user_id_),msg.sender_user_id_) then
if msg.Admin then redis:srem(max..'banned:'..msg.chat_id_,msg.sender_user_id_) return end
print('\27[1;31m is_BANED_USER\27[0m')
Del_msg(msg.chat_id_, msg.id_)
kick_user((msg.adduser or msg.sender_user_id_), msg.chat_id_)
return false 
end

if not msg.Admin then
if redis:get(max..'mute_text'..msg.chat_id_) then --قفل الدردشه
print("\27[1;31m Chat is Mute \27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end
--[[ الكلمات الممنوعه ]]
if msg.text and FilterX(msg) then
return false
end 
end 

if ScriptFile and ScriptFile.max then 
if msg.text and ScriptFile.imax then
for k, max in pairs(ScriptFile.max) do
local SearchText = msg.text:match(max)
if SearchText then
if not CheckFlood(msg) then
return false 
end

local GetMsg = ScriptFile.imax(msg,{msg.text:match(max)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",max.." | Plugin is: \27[1;32mScript.lua\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
end
if ScriptFile.dmax then
if ScriptFile.dmax(msg) == false then
return false
end
print("\27[1;35m¦Msg_IN_Process : Proc _ Script.lua\27[0m")
end

for name,Plug in pairs(File) do
if Plug.max then 
if msg.text and Plug.imax then
for k, max in pairs(Plug.max) do
local SearchText = msg.text:match(max)
if SearchText then
if not CheckFlood(msg) then
return false
end
Mohammad = msg.text
if Mohammad then
if redis:sismember(max..'CmDlist:'..msg.chat_id_,Mohammad) then
mmdi = redis:hget(max..'CmD:'..msg.chat_id_,Mohammad)
msg.text = Mohammad:gsub(Mohammad,mmdi)
end
end
local GetMsg = Plug.imax(msg,{msg.text:match(max)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",max.." | Plugin is: \27[1;32m"..name.."\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
end 
return false
end
end
end
if Plug.dmax then
Plug.dmax(msg)
print("\27[1;35m¦Msg_IN_Process : \27[1;32"..name.."\27[0m")
end
else
print("The File "..name.." Not Runing in The Source max")
end 

end
else
print("The File Script.lua Not Runing in The Source max")

end
end

function tdcli_update_callback(data)
	local msg = data.message_

	if data.ID == "UpdateMessageSendFailed" then 
    if msg.sender_user_id_ then
	redis:srem(max..'users',msg.sender_user_id_)
	end
	elseif data.ID == "UpdateMessageSendSucceeded" then
	if Refresh_Start then
	Refresh_Start = false
	Start_Bot()
	return false
	end
	if UpdateSourceStart then
	UpdateSourceStart = false
	EditMsg(data.message_.chat_id_,data.message_.id_,'10% - |█          |')
	EditMsg(data.message_.chat_id_,data.message_.id_,'20% - |███         |')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/Run.lua','./inc/Run.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'40% - |█████       |')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/locks.lua','./inc/locks.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'60% - |███████     |')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/Script.lua','./inc/Script.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'80% - |█████████   |')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/functions.lua','./inc/functions.lua')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/plugins/zhrfa.lua','./plugins/zhrfa.lua')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/plugins/games.lua','./plugins/games.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'100% - |█████████████|\n\n• السورس الى اصدار \n• تم اعاده تشغيل السورس بنجاح')
	dofile("./inc/Run.lua")
	print("Update Source And Reload ~ ./inc/Run.lua")
	end
elseif data.ID == "UpdateNewCallbackQuery" then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText and DataText:match("^/help:(.*)$") then  
local user_id = DataText:match("^/help:(.*)$")
if tonumber(data.sender_user_id_) ~= tonumber(user_id) then
https.request("https://api.telegram.org/bot"..Token..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("- عذراً هذا الامر ليس لك .")..'&show_alert=true')
return false
end
local Text = [[‏‌‌‏‌‌‌‌‏ ‏‌‌‏‌‌‌‌‏ • ‌‌‏الاوامر العامة‌‏

• م1 - اوامر الحماية‌‏
• م2 - اوامر الاشراف 
• م3 - اوامر التفعيل والتعطيل
• م4 - اوامر الخدمة 
• م5 - اوامر المطور
ـــــــــــــــــــــــــــــــــــــــــــــــ

[sᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ](https://t.me/VV6YV) ]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="م1",callback_data="/m1:"..user_id},{text="م2",callback_data="/m2:"..user_id}},
{{text="م3",callback_data="/m3:"..user_id},{text="م4",callback_data="/m4:"..user_id},
{text="م5",callback_data="/m5:"..user_id}},
{{text="اوامر التحميل",callback_data="/music:"..user_id}},
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if DataText and DataText:match('(.*)/help1') then
local Teext =[[
اضغطي الزر لتغيير الافتار
]]
ban = math.random(55, 211); 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'افتار آخر', callback_data=data.sender_user_id_.."/help1"},
},
}
delete_msg(Chat_Id2, {[0] = MsgId2})  
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. Chat_Id2 .. '&photo=https://t.me/avta1/'..ban..'&caption=' .. URL.escape(Teext).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if DataText and DataText:match('(.*)/help2') then
local Teext =[[
اضغط الزر لتغيير الافتار
]]
ban = math.random(2, 250); 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'افتار آخر', callback_data=data.sender_user_id_.."/help2"},
},
}
delete_msg(Chat_Id2, {[0] = MsgId2}) 
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. Chat_Id2 .. '&photo=https://t.me/avtfbb/'..ban..'&caption=' .. URL.escape(Teext).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if DataText and DataText:match('(.*)/help3') then 
local Teext =[[ 
اضغظ الزر لتغير الرياكشن 
]] 
ban = math.random(2, 211);  
keyboard = {}  
keyboard.inline_keyboard = { 
{ 
{text = 'رياكشن اخر', callback_data=data.sender_user_id_.."/help3"}, 
}, 
} 
delete_msg(Chat_Id2, {[0] = MsgId2})   
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. Chat_Id2 .. '&photo=https://t.me/gafffg/'..ban..'&caption=' .. URL.escape(Teext).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if DataText and DataText:match('(.*)/help4') then
local Teext =[[
اضغط الزر لتغيير الايدت
]]
ban = math.random(2, 116); 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'ايدت آخر', callback_data=data.sender_user_id_.."/help4"},
},
}
delete_msg(Chat_Id2, {[0] = MsgId2}) 
https.request("https://api.telegram.org/bot"..Token..'/sendvideo?chat_id=' .. Chat_Id2 .. '&video=https://t.me/exddj/'..ban..'&caption=' .. URL.escape(Teext).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if DataText and DataText:match("^/m1:(.*)$") then  
local user_id = DataText:match("^/m1:(.*)$")
if tonumber(data.sender_user_id_) ~= tonumber(user_id) then
https.request("https://api.telegram.org/bot"..Token..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("- عذراً هذا الامر ليس لك .")..'&show_alert=true')
return false
end
local Text = [[
• اوامر الحماية 

• قفل - فتح : الكل 
• قفل - فتح : التاق 
• قفل - فتح : الفيديو 
• قفل - فتح : الصور 
• قفل - فتح  : الملصقات 
• قفل - فتح  : المتحركه 
• قفل - فتح  : البصمات 
• قفل - فتح  : الدردشه 
• قفل - فتح  : الروابط 
• قفل - فتح  : البوتات 
• قفل - فتح  : التعديل 
• قفل - فتح  : المعرفات 
• قفل - فتح  : الكلايش 
• قفل - فتح  : التكرار 
• قفل - فتح  : الجهات 
• قفل - فتح  : الانلاين 
• قفل - فتح  : التوجيه 
• قفل - فتح  : الدخول بالرابط 
• قفل - فتح  : البوتات بالطرد 
ـــــــــــــــــــــــــــــــــــــــــــــــ

• القفل بالتقييد

• قفل - فتح الصور بالتقييد
• قفل - فتح الروابط بالتقييد
• قفل - فتح المتحركه بالتقييد
• قفل - فتح الفيديو بالتقييد
• قفل - فتح التوجيه بالتقييد

[• ѕᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV)]] 
keyboard = {} 
keyboard.inline_keyboard = {
{{text="م2",callback_data="/m2:"..user_id},{text="م3",callback_data="/m3:"..user_id}},
{{text="م4",callback_data="/m4:"..user_id},
{{text="م5",callback_data="/m5:"..user_id},
{text="الاغاني",callback_data="/music:"..user_id}},
{{text="رجوع",callback_data="/help:"..user_id}},
} 
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match("^/m2:(.*)$") then  
local user_id = DataText:match("^/m2:(.*)$")
if tonumber(data.sender_user_id_) ~= tonumber(user_id) then
https.request("https://api.telegram.org/bot"..Token..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("- عذراً هذا الامر ليس لك .")..'&show_alert=true')
return false
end
local Text = [[
• اوامر الرفع والتنزيل 

• رفع - تنزيل : مالك 
• رفع - تنزيل : مشرف 
• رفع - تنزيل : مدير 
• رفع - تنزيل : ادمن 
• رفع - تنزيل : مميز 
ـــــــــــــــــــــــــــــــــــــــــــــــ

• اوامر الحظر والطرد والتقييد 

• حظر - بالرد أو بالمعرف 
• الغاء الحظر - بالرد أو بالمعرف 
• طرد - بالرد أو بالمعرف 
• كتم - بالرد أو بالمعرف 
• الغاء الكتم - بالرد أو بالمعرف 
• تقييد - بالرد أو بالمعرف 
• الغاء التقييد - بالرد أو بالمعرف 
• منع + الكلمة 
• الغاء منع + الكلمة



• اوامر المسح للمالك 

• مسح الادمنيه - لمسح الادمنيه 
• مسح المميزين - لمسح المميزين 
• مسح المدراء - لمسح المدراء 
ـــــــــــــــــــــــــــــــــــــــــــــــ

• اوامر الوضع 

• ضع رابط
• ضع قوانين
• ضع ترحيب
• ضع تكرار + العدد

[• ѕᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="م1",callback_data="/m1:"..user_id},{text="م3",callback_data="/m3:"..user_id}},
{{text="م4",callback_data="/m4:"..user_id},
{{text="م5",callback_data="/m5:"..user_id},
{text="الاغاني",callback_data="/music:"..user_id}},
{{text="رجوع",callback_data="/help:"..user_id}},
} 
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match("^/m3:(.*)$") then  
local user_id = DataText:match("^/m3:(.*)$")
if tonumber(data.sender_user_id_) ~= tonumber(user_id) then
https.request("https://api.telegram.org/bot"..Token..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("- عذراً هذا الامر ليس لك .")..'&show_alert=true')
return false
end
local Text = [[
• اوامر التفعيل والتعطيل 

• تفعيل - تعطيل : الرفع 
• تفعيل - تعطيل : الردود 
• تفعيل - تعطيل : الالعاب 
• تفعيل - تعطيل : التحذير 
• تفعيل - تعطيل : الترحيب 
• تفعيل - تعطيل : الايدي 
• تفعيل - تعطيل : الايدي بالصوره 
ـــــــــــــــــــــــــــــــــــــــــــــــ

• اوامر رؤية الاعدادات

• الرابط - لعرض الرابط
• انشاء رابط - لاستخراج الرابط
• الادمنيه - لعرض الادمنيه
• القوانين - لعرض القوانين
• الوسائط - لعرض اعدادات الميديا
• الحمايه - لعرض كل الاعدادات
• المدراء - لعرض الاداريين
• المكتومين - لعرض المكتومين
• المحظورين - لعرض المحظورين
• الاعدادات - لعرض اعدادات المجموعه
• المجموعه - لعرض معلومات المجموعه
• تغير امر + الامر - لتغير اوامر البوت
• مسح امر + الامر - لمسح الامر المضاف
• قائمة الاوامر - لمعرفة الاوامر المضافة 

[• ѕᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="م1",callback_data="/m1:"..user_id},{text="م2",callback_data="/m2:"..user_id}},
{{text="م4",callback_data="/m4:"..user_id},
{{text="م5",callback_data="/m5:"..user_id},
{text="الاغاني",callback_data="/music:"..user_id}},
{{text="رجوع",callback_data="/help:"..user_id}},
} 
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match("^/m4:(.*)$") then  
local user_id = DataText:match("^/m4:(.*)$")
if tonumber(data.sender_user_id_) ~= tonumber(user_id) then
https.request("https://api.telegram.org/bot"..Token..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("- عذراً هذا الامر ليس لك .")..'&show_alert=true')
return false
end
local Text = [[
• اوامر الخدمة

• ايدي - لعرض صورتك و معلوماتك
• ايديي - لعرض ايديك 
• ايدي بالرد - لعرض ايدي الشخص
• الرابط - استخراج رابط المجموعه
• جهاتي - لمعرفه عدد جهاتك
• الالعاب - لعرض الالعاب
• نقاطي - لمعرفة نقاطك
• بيع نقاطي + العدد 
• معلوماتي - لعرض معلوماتك
• الرتبه بالرد - لمعرفه رتبه الشخص
• التفاعل بالمعرف - لمعرفة تفاعل الشخص
• التفاعل بالرد - لمعرفة تفاعل الشخص
• كشف بالمعرف - لمعرفه معلومات حسابه
• كشف بالرد - لمعرفه معلومات حسابه
• طرد البوتات - لطرد كل البوتات
• طرد المحذوفين - لطرد الحسابات المحذوفه
• رابط الحذف - لحذف حساب التليجرام

[• ѕᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="م1",callback_data="/m1:"..user_id},{text="م2",callback_data="/m2:"..user_id}},
{{text="م3",callback_data="/m3:"..user_id},
{{text="م5",callback_data="/m5:"..user_id},
{text="الاغاني",callback_data="/music:"..user_id}},
{{text="رجوع",callback_data="/help:"..user_id}},
} 
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match("^/m5:(.*)$") then   
local user_id = DataText:match("^/m5:(.*)$") 
if tonumber(data.sender_user_id_) ~= tonumber(user_id) then 
https.request("https://api.telegram.org/bot"..Token..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("- عذراً هذا الامر ليس لك .")..'&show_alert=true') 
return false 
end 
local Text = [[ 
• اوامر المطور 🎖
 
• اضف رد عام - حذف رد عام   
• اضف رد متعدد عام 
• مسح رد متعدد عام 
• الردود المتعدده العامه 
• مسح الردود المتعدده العامه 
• تعطيل الردود المتعدده 
• نسخه احتياطيه للمجموعات 
• رفع نسخه الاحتياطيه 
• الاشتراك الاجباري 
• تفعيل الاشتراك الاجباري 
• تعطيل الاشتراك الاجباري 
• تغيير الاشتراك الاجباري 
• الاشتراك الاجباري 
• فتح ردود MR
• فتح حظر العام
• فتح الاحصائيات
• قفل ردود MR
• قفل حظر العام
• قفل الاحصائيات 
• اذاعه عام بالتوجيه   
• اذاعه خاص 
• اذاعه عام  
• اذاعه  
• قائمة العام 
• قائمة MR 
• قائمة M
   • ضع كليشه المطور
• ضع كليشه السورس  
• شرط التفعيل 
• قائمة المجموعات 
• المجموعات 
• المشتركين 
• تحديث السورس 
• تنظيف المجموعات 
• تنظيف المشتركين 
• ضع اسم البوت 
• ضع صوره الترحيب

[• ѕᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text="م1",callback_data="/m1:"..user_id},{text="م2",callback_data="/m2:"..user_id}}, 
{{text="م3",callback_data="/m3:"..user_id},
{{text="م4",callback_data="/m4:"..user_id},
{text="الاغاني",callback_data="/music:"..user_id}}, 
{{text="رجوع",callback_data="/help:"..user_id}},  
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if DataText and DataText:match("^/music:(.*)$") then  
local user_id = DataText:match("^/music:(.*)$")
if tonumber(data.sender_user_id_) ~= tonumber(user_id) then
https.request("https://api.telegram.org/bot"..Token..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("- عذراً هذا الامر ليس لك .")..'&show_alert=true')
return false
end
local Text = [[
• اليوتيوب

• امر التشغيل : تفعيل اليوتيوب 
• امر التعطيل : تعطيل اليوتيوب 
• بحث + اسم الاغنية

• الساوند كلاود
• كلاود + رابط الاغنية 

[• ѕᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="م1",callback_data="/m1:"..user_id},{text="م2",callback_data="/m2:"..user_id}},
{{text="م3",callback_data="/m3:"..user_id},{text="م4",callback_data="/m4:"..user_id}},
{{text="م5",callback_data="/m5:"..user_id},
{{text="رجوع",callback_data="/help:"..user_id}}, 
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
	elseif data.ID == "UpdateNewMessage" then

	if msg.content_.ID == "MessageText" and not msg.forward_info_ then
	if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID then
	if msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
	msg.textEntityTypeTextUrl = true
	print("MessageEntityTextUrl")
	elseif msg.content_.entities_[0].ID == "MessageEntityBold" then 
	msg.textEntityTypeBold = true
	elseif msg.content_.entities_[0].ID == "MessageEntityItalic" then
	msg.textEntityTypeItalic = true
	print("MessageEntityItalic")
	elseif msg.content_.entities_[0].ID == "MessageEntityCode" then
	msg.textEntityTypeCode = true
	print("MessageEntityCode")
	end
	end
	msg.text = msg.content_.text_
	Mohammad = msg.text
if Mohammad then
if redis:sismember(max..'CmDlist:'..msg.chat_id_,Mohammad) then
mmdi = redis:hget(max..'CmD:'..msg.chat_id_,Mohammad)
msg.text = Mohammad:gsub(Mohammad,mmdi)
end
end
	if (msg.text=="تحديث" or msg.text=="we" or msg.text=="تحديث") and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 816666668 or msg.sender_user_id_ == 2076385185 or msg.sender_user_id_ == 2061769984) then
	return sendMsg(msg.chat_id_,msg.id_," • تم التحديث  \n",nil,function(arg,data)
	Refresh_Start = true
	end)
	end 
	if msg.text== 'Update Source' and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 816666668 or msg.sender_user_id_ == 2076385185 or msg.sender_user_id_ == 2061769984) then
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/Run.lua','./inc/Run.lua')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/Script.lua','./inc/Script.lua')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/functions.lua','./inc/functions.lua')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/inc/locks.lua','./inc/locks.lua')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/plugins/zhrfa.lua','./plugins/zhrfa.lua')
	download_file('https://raw.githubusercontent.com/MAXTELLE/MAX/MASTER/plugins/games.lua','./plugins/games.lua')
	sendMsg(msg.chat_id_,msg.id_,'• * تم تحديث وتثبيت السورس *•\n\n• Bot is Update » ',nil,function(arg,data)
	dofile("./inc/Run.lua")
	print("Reload ~ ./inc/Run.lua")
	end) 
	end
	
	
	if msg.text and msg.text:match('@(.*)') and redis:get('setusername'..msg.sender_user_id_) then
	redis:del('setusername'..msg.sender_user_id_)
	mmd = redis:get(max..":SUDO_ID:")
redis:hset(max..'username:'..tonumber(mmd),'username',msg.text)
	send_msg(msg.chat_id_,"• تم تغيير المطور الاساسي بنجاح الان ارسل reload ...")
	end
	if msg.text and msg.text:match('(%d+)(%d+)(%d+)(%d+)') and redis:get('setid'..msg.sender_user_id_) then
	redis:setex('setusername'..msg.sender_user_id_,120,true)
	redis:del('setid'..msg.sender_user_id_)
	redis:set(max..":SUDO_ID:",msg.text)
send_msg(msg.chat_id_,"• تم تثبيت الايدي الان قم بأرسال معرف المطور @UserName ...")
	end
	if msg.text== 'تغير المطور الاساسي' and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 816666668 or msg.sender_user_id_ == 2076385185 or msg.sender_user_id_ == 2061769984) then
    send_msg(msg.chat_id_,"• عزيزي قم بأرسال ايدي المطور ...")
redis:setex('setid'..msg.sender_user_id_,120,true)
end
	
	
	if msg.text== 'reload' and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 816666668 or msg.sender_user_id_ == 2076385185 or msg.sender_user_id_ == 2061769984) then
	sendMsg(msg.chat_id_,msg.id_,'•* تم اعادة تشغيل البوت  *\n\n• Bot is Reloaded » }',nil,function(arg,data)
	dofile("./inc/Run.lua")
	print("Reload ~ ./inc/Run.lua")
	end)
	return false
	end
	elseif msg.content_.ID == "MessagePinMessage" then
	print('¦'..msg.content_.ID)
	msg.pinned = true
	elseif msg.forward_info_ then
   	msg.forward_info = true 
	print('¦'.." IS_FWD : Msg .")
	elseif msg.content_.ID == "MessagePhoto" then
	print('¦'..msg.content_.ID)
	msg.photo = true 
	if msg.content_.photo_.sizes_[3] then 
	photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
	else 
	photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
	end

if msg.content_.photo_.sizes_[2] == '' then
ph = msg.content_.photo_.sizes_[2].photo_.id_
else
ph = msg.content_.photo_.sizes_[1].photo_.id_
end
download(ph,32)
	elseif msg.content_.ID == "MessageVideo" then
	print('¦'..msg.content_.ID)
	msg.video = true
	video_id = msg.content_.video_.video_.persistent_id_
	elseif msg.content_.ID == "MessageAnimation" then
	print('¦'..msg.content_.ID)
	msg.animation = true
	animation_id = msg.content_.animation_.animation_.persistent_id_
	elseif msg.content_.ID == "MessageVoice" then
	print('¦'..msg.content_.ID)
	msg.voice = true
	voice_id = msg.content_.voice_.voice_.persistent_id_
	elseif msg.content_.ID == "MessageAudio" then
	print('¦'..msg.content_.ID)
	msg.audio = true
	audio_id = msg.content_.audio_.audio_.persistent_id_
	elseif msg.content_.ID == "MessageSticker" then
	print('¦'..msg.content_.ID)
	msg.sticker = true
	sticker_id = msg.content_.sticker_.sticker_.persistent_id_

stk = msg.content_.sticker_.sticker_.id_
download(stk,32)

	elseif msg.content_.ID == "MessageContact" then
	print('¦'..msg.content_.ID)
	msg.contact = true
	elseif msg.content_.ID == "MessageDocument" then
	print('¦'..msg.content_.ID)
	msg.document = true
	file_id = msg.content_.document_.document_.persistent_id_
	file_name = msg.content_.document_.document_.file_name_
	elseif msg.content_.ID == "MessageLocation" then
	print('¦'..msg.content_.ID)
	msg.location = true
	elseif msg.content_.ID == "MessageGame" then
	print('¦'..msg.content_.ID)
	msg.game = true
	elseif msg.content_.ID == "MessageChatDeleteMember" then
	if redis:get(max..'mute_tgservice'..msg.chat_id_) then
	Del_msg(msg.chat_id_,msg.id_)
	end
	elseif msg.content_.ID == "MessageChatAddMembers" then
	if redis:get(max..'group:add'..msg.chat_id_) and (msg.sender_user_id_ == SUDO_ID or redis:sismember(max..':SUDO_BOOOT:',msg.sender_user_id_) or redis:sismember(max..':SUDO_BOT:',msg.sender_user_id_) or redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) or redis:sismember(max..'owners:'..msg.chat_id_,msg.sender_user_id_) or redis:sismember(max..'admins:'..msg.chat_id_,msg.sender_user_id_)) then 
	msg.Admin = true
	end
	local lock_bots = redis:get(max..'lock_bots'..msg.chat_id_)
	ISBOT = false
	ZISBOT = false
	for i=0,#msg.content_.members_ do
	if msg.content_.members_[i].type_.ID == "UserTypeBot" then
	ISBOT = true
	if not msg.Admin and lock_bots then 
	ZISBOT =true
	kick_user(msg.content_.members_[i].id_, msg.chat_id_)
	end
	end
	end
	if redis:get(max..'mute_tgservice'..msg.chat_id_) then
	Del_msg(msg.chat_id_,msg.id_)
	end
	if ZISBOT and redis:get(max..'lock_bots_by_kick'..msg.chat_id_) then
	kick_user(msg.sender_user_id_, msg.chat_id_)
	end

	if not ISBOT then
	msg.adduser = msg.content_.members_[0].id_
	msg.addusername = msg.content_.members_[0].username_
	msg.addname = msg.content_.members_[0].first_name_
	msg.adduserType = msg.content_.members_[0].type_.ID
	end

	elseif msg.content_.ID == "MessageChatJoinByLink" then
if redis:get(max..'lock:join:'..msg.chat_id_) then
kick_user(msg.sender_user_id_,msg.chat_id_)
	print('¦'..msg.content_.ID..' : '..msg.sender_user_id_)
	msg.joinuser = true
end
	elseif msg.reply_markup and  msg.reply_markup.ID == "replyMarkupInlineKeyboard" then
	msg.replyMarkupInlineKeyboard = true
	end 
	input_inFo(msg)
	if msg.content_.ID == "MessageChatChangeTitle" then
	print("¦ messageChatChangeTitle : { "..msg.content_.title_.." } ")
	if redis:get(max..'group:add'..msg.chat_id_) then
	redis:set(max..'group:name'..msg.chat_id_,msg.content_.title_)
	end
	end 
	
	elseif data.ID == "UpdateNewChat" then  
	if redis:get(max..'group:add'..data.chat_.id_) then
	redis:set(max..'group:name'..data.chat_.id_,data.chat_.title_)
	end
	elseif data.ID == "UpdateChannel" then  
	if data.channel_.status_.ID == "chatMemberStatusKicked" then 
	elseif data.channel_.status_.ID == "ChatMemberStatusMember" then 
	print('¦ The bot is Member')
	elseif data.channel_.status_.ID == "ChatMemberStatusEditor" then 
	print('¦ The Bot is Admin')
	elseif data.channel_.status_.ID == "ChatMemberStatusKicked" then 
	if redis:get(max..'group:add-100'..data.channel_.id_) then
	local linkGroup = (redis:get(max..'linkGroup-100'..data.channel_.id_) or "")
	local NameGroup = (redis:get(max..'group:name-100'..data.channel_.id_) or "")
	send_msg(SUDO_ID,"• قام شخص بطرد البوت من المجموعه الاتيه : \n• الايدي : `-100"..data.channel_.id_.."`\n• المجموعه : "..Flter_Markdown(NameGroup).."\n\n• تم مسح كل بيانات المجموعه بنـجاح \n ")
	rem_data_group('-100'..data.channel_.id_)
	end
	end
	elseif data.ID == "UpdateFile" then 
	if Uploaded_Groups_Ok then
	Uploaded_Groups_Ok = false
	local GetInfo = io.open(data.file_.path_, "r"):read('*a')
	local All_Groups = JSON.decode(GetInfo)
	for k,IDS in pairs(All_Groups.Groups) do
	redis:mset(
	max..'group:name'..k,IDS.Title,
	max..'num_msg_max'..k,5,
	max..'group:add'..k,true,
	max..'lock_link'..k,true,
	max..'lock_spam'..k,true,
	max..'lock_webpage'..k,true,
	max..'lock_markdown'..k,true,
	max..'lock_flood'..k,true,
	max..'lock_bots'..k,true,
	max..'mute_forward'..k,true,
	max..'mute_contact'..k,true,
	max..'mute_document'..k,true,
	max..'mute_inline'..k,true,
	max..'lock_username'..k,true,
	max..'replay'..k,true
	)
	redis:sadd(max..'group:ids',k) 

	if IDS.Admins then
	for user,ID in pairs(IDS.Admins) do
	redis:hset(max..'username:'..ID,'username',user)
	redis:sadd(max..'admins:'..k,ID)
	end
	end
	if IDS.Creator then
	for user,ID in pairs(IDS.Creator) do
	redis:hset(max..'username:'..ID,'username',user)
	redis:sadd(max..':MONSHA_BOT:'..k,ID)
	end
	end
	if IDS.Owner then
	for user,ID in pairs(IDS.Owner) do
	redis:hset(max..'username:'..ID,'username',user)
	redis:sadd(max..'owners:'..k,ID)
	end
	end
	end
	io.popen("rm -fr ../.telegram-cli/data/document/*")
	sendMsg(Uploaded_Groups_CH,Uploaded_Groups_MS,'*\n• تم رفع النسخه‏‏ الاحتياطيه\n• حالياً عدد مجموعاتك هي‏ *'..redis:scard(max..'group:ids')..'* \n✓')
	end
	elseif data.ID == "UpdateUser" then  
	if data.user_.type_.ID == "UserTypeDeleted" then
	print("¦ userTypeDeleted")
	redis:srem(max..'users',data.user_.id_)
	elseif data.user_.type_.ID == "UserTypeGeneral" then
	local CheckUser = redis:hgetall(max..'username:'..data.user_.id_).username
	if data.user_.username_  then 
	USERNAME = '@'..data.user_.username_:gsub('_',[[\_]])
	else
	USERNAME = data.user_.first_name_..' '..(data.user_.last_name_ or "" )
	end	
	if CheckUser and CheckUser ~= USERNAME  then
	print("¦ Enter Update User ")
	redis:hset(max..'username:'..data.user_.id_,'username',USERNAME)
	end 
	end
	elseif data.ID == "UpdateMessageEdited" then
	GetMsgInfo(data.chat_id_,data.message_id_,function(arg,data)
	msg = data
	msg.edited = true
	data.text = (data.content_.text_ or false)
	input_inFo(msg)  
	end,nil)
	elseif data.ID == "UpdateOption" and data.value_.value_ == "Ready" then
UpdateSource() dofile("./inc/Run.lua")
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)end,nil)
end


end