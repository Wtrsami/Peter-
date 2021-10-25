
function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

local getUser = function(user_id,cb)
tdcli_function({ID = "GetUser",user_id_ = user_id},cb,nil)
end

Bot_Api = 'https://api.telegram.org/bot'.. Token
function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end








function lock_photos(msg)
if not msg.Director then 
return "*•* هذا الامر يخص {المدير,المالك,LEADER} بس "
end
redis:set(max.."getidstatus"..msg.chat_id_, "Simple")
return  "*•* أهلا عيني "..msg.TheRankCmd.."\n*•* تم عطلت الايدي بالصوره \n𓄹𓄼" 
end 
function unlock_photos(msg)
if not msg.Director then
return "*•* هذا الامر يخص {المدير,المالك,LEADER} بس "
end
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
return  "*•* اهلين عيني "..msg.TheRankCmd.."\n*•* تم فعلت الايدي بالصوره \n" 
end
function cmds_on(msg)
if not msg.Creator then return "*•* هذا الامر يخص {المالك,LEADER} بس  "
end
redis:set(max..'lock:kara:'..msg.chat_id_,'on')
return "*•* أهلا عيني "..msg.TheRankCmd.."\n*•* تم عطلت الرفع في المجموعه \n "
end
function cmds_off(msg)
if not msg.Creator then return "*•* هذا الامر يخص {المالك,LEADER} بس "
end
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return "*•* أهلين عيني "..msg.TheRankCmd.."\n*•* تم فعلت الرفع في المجموعه \n"
end

function lockjoin(msg)
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  "
end
redis:set(max..'lock:join:'..msg.chat_id_,true)
return "**•* أهلا عيني *"..msg.TheRankCmd.."*\n*•* تم قفلت الدخول بالرابط \n *" 

end
function unlockjoin(msg)
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  "
end
redis:del(max..'lock:join:'..msg.chat_id_)
return "**•* أهلين عيني *"..msg.TheRankCmd.."*\n*•* تم فتحت الدخول بالرابط  \n*" 
end


local function imax(msg,MsgText)

Channel = redis:get(max..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(max..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUser then
function name(arg,data)
bd = '• اسمك  ('..(data.first_name_ or '')..')\n• معرفك (@'..(data.username_ or '')..')\n\n• اشـترك بالقناة اول \n• بعدها ارجع .'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'اشترك بالقناة •',url='https://telegram.me/'..Channel}}}   
send_inline(msg.chat_id_,bd,keyboard,'html')
end
getUser(msg.sender_user_id_,name)
else
return true
end
else
return true
end
end
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end




if MsgText[1] == "تفعيل الايدي بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول بالرابط" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول بالرابط" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "• هذا الامر يخص {LEADER} بس " end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(max..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'• تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'• تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n• في مجموعه  » »  '..redis:get(max..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'-› عيني المطور ✋🏿\n- شحن الاشتراك يكون ما بين يوم الى 1000 يوم بس 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "• هذا الامر يخص {LEADER} بس " end
if MsgText[2] == '1' then
redis:setex(max..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'• تم تفعيل الاشتراك   👍🏿\n• الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'• تم تفعيل الاشتراك  👍🏿\n• الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(max..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'• تم تفعيل الاشتراك   👍🏿\n• الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'• تم تفعيل الاشتراك   👍🏿\n• الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(max..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(max..'CheckExpire::'..msg.chat_id_) then 
redis:set(max..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'• تم تفعيل الاشتراك   👍🏿\n• الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'• تم تفعيل الاشتراك   👍🏿\n• الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end
local check_time = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*• مـفـتـوح *🎖' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '•`باقي من الاشتراك ` » » * \n - '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '•`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '•`باقي من الاشتراك ` » » * \n - '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '•`باقي من الاشتراك ` » » * \n - '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '•`باقي من الاشتراك ` » » * \n - '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '•`باقي من الاشتراك ` » » * \n - '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(max..'group:name'..msg.chat_id_) or '')
redis:set(max..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"• ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*•* عدد الاعـضـاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*•* عدد المحظـوريـن ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*•* عدد الادمـنـيـه ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*•* ايدي المجموعه ⇜ ❪"..msg.chat_id_.."❫"
.."\n\n• الاسم ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "️*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمة المنع" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس" end
return settingsall(msg) 
end

if MsgText[1] == "المالك" then
local creator = redis:get(max..':mon:'..msg.chat_id_) or 12566691410
GetUserID(creator,function (arg,data)
sendMsg(msg.chat_id_,msg.id_,"["..data.first_name_.."](t.me/"..data.username_..")")
end)
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return GetListAdmin(msg) 
end

if MsgText[1] == "منشن" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,hasn)
local t = "\n• قائمة الاعضاء \n________________\n"
x = 0
local list = hasn.members_
for k, v in pairs(list) do
users = redis:get(max..'user_names:'..v.user_id_) or v.user_id_
x = x + 1
t = t..""..x.." - {["..users.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if (MsgText[1] == "منشن للمشرفين" and is_JoinChannel(msg)) then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return ownerlist(msg) ..GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "منشن للكل" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "@all" then  
if not msg.Admin then return "⇠ هذا الامر يخص ( الادمن,المدير,المنشئ,المطور ) بس \n" end 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa)   
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,datate)  
x = 0  
tags = 0  
local list = datate.members_   
for k, v in pairs(list) do  
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)  
if x == 5 or x == tags or k == 0 then  
tags = x + 5  
t = "#all"  
end  
x = x + 1  
tagname = data.first_name_  
tagname = tagname:gsub("]","")  
tagname = tagname:gsub("[[]","")  
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"  
if x == 5 or x == tags or k == 0 then  
local Text = t:gsub(',','\n')  
local msg_id = msg.id_/2097152/0.5  
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")  
end  
end,nil)  
end  
end,nil)  
end,nil)  
end


if MsgText[1] == "المدراء" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return ownerlist(msg) 
end


if MsgText[1] == "المميزين" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس " end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس " end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'• المعرف غير صحيح')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'• هاذا معرف قناة')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. max..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\n• اهلا عيني البوت هنا ادمن بالقروب \n• صلاحياته هي ⇓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n• تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n• حذف الرسائل ↞ ❪ '..delete..' ❫\n• حظر المستخدمين ↞ ❪ '..restrict..' ❫\n• دعوة مستخدمين ↞ ❪ '..invite..' ❫\n• تثبيت الرسائل ↞ ❪ '..pin..' ❫\n• اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n- ملاحظة » علامة ❪  ꪜ ❫ يعني عنده الصلاحية وعلامة ❪ ✘ ❫ يعني ماعنده الا الضعوي')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "• مايمديك التثبيت الامر مقفل من الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.." \n*•* ابشر تم تثبيت الرساله \n𓄹𓄼 ")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* معليش مايمديني التثبيت .\n*•* مو مشرفه او ماعندي صلاحية التثبيت \n𓄹𓄼')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "• مايمديك تلغي التثبيت الامر مقفل من الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."  \n*•* تم الغاء تثبيت الرساله \n𓄹𓄼 ")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* معليش لا يمكنني الغاء التثبيت .\n*•* لست مشرف او لا املك صلاحيه التثبيت \n𓄹𓄼 ')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'*•* معليش عيني '..msg.TheRankCmd..' .\n*•* مافي رساله مثبته عشان اقدر ازيلها \n𓄹𓄼 ')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "الغاء التقييد" or MsgText[1] == "فك التقييد" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."\n*•*  الرفع معطل \n𓄹𓄼 ")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "*•* هذا الامر يخص {LEADER,المالك} بس  " end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."\n*•*  الرفع معطل ")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "*•* هذا الامر يخص {LEADER,المالك} بس  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع مالك اساسي" or MsgText[1] == "رفع منشئ اساسي") then
if not msg.SudoUser then return "*•* هذا الامر يخص {Dev,LEADER} بس  " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "تنزيل مالك اساسي" or MsgText[1] == "تنزيل منشئ اساسي") then
if not msg.SudoUser then return "*•* هذا الامر يخص {Dev,LEADER} بس  " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "رفع مالك" or MsgText[1] == "رفع منشئ") then
if not msg.Kara then return "*•* هذا الامر يخص {المالك الاساسي,Dev,LEADER} بس  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل مالك" or MsgText[1] == "تنزيل منشئ") then
if not msg.Kara then return "*•* هذا الامر يخص {LEADER,المالك الاساسي } بس  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
if not MsgText[2] and msg.reply_id then
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(max..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."\n*•*  الرفع معطل \n𓄹𓄼 ")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "تنزيل الكل" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end

if not msg.reply_id and not MsgText[2]  then
if msg.SudoBase then
numKARA_BOT = redis:scard(max..':KARA_BOT:'..msg.chat_id_)
numMONSHA = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
numowners = redis:scard(max..'owners:'..msg.chat_id_)
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..':KARA_BOT:'..msg.chat_id_)
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• اهلين عيني "..msg.TheRankCmd.." ⇓\n• تــم تنزيل ❴ "..numKARA_BOT.." ❵ من المالكين  الاساسيين\n• تــم تنزيل ❴ "..numMONSHA.." ❵ من المالكين \n• تــم تنزيل ❴ "..numowners.." ❵ من المدراء\n• تــم تنزيل ❴ "..numadmins.." ❵ من الادمنيه\n• تــم تنزيل ❴ "..numwhitelist.." ❵ من المميزين\n\n ༄ " 
elseif msg.SudoUser then 
numKARA_BOT = redis:scard(max..':KARA_BOT:'..msg.chat_id_)
numMONSHA = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
numowners = redis:scard(max..'owners:'..msg.chat_id_)
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..':KARA_BOT:'..msg.chat_id_)
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• اهلين عيني "..msg.TheRankCmd.." ⇓\n• تــم تنزيل ❴ "..numKARA_BOT.." ❵ من المالكين  الاساسيين\n• تــم تنزيل ❴ "..numMONSHA.." ❵ من المالكين \n• تــم تنزيل ❴ "..numowners.." ❵ من المدراء\n• تــم تنزيل ❴ "..numadmins.." ❵ من الادمنيه\n• تــم تنزيل ❴ "..numwhitelist.." ❵ من المميزين\n\n ༄ " 
elseif msg.Kara then 
numMONSHA = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
numowners = redis:scard(max..'owners:'..msg.chat_id_)
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• اهلين عيني "..msg.TheRankCmd.." ⇓\n• تــم تنزيل ❴ "..numMONSHA.." ❵ من المالكين \n• تــم تنزيل ❴ "..numowners.." ❵ من المدراء\n• تــم تنزيل ❴ "..numadmins.." ❵ من الادمنيه\n• تــم تنزيل ❴ "..numwhitelist.." ❵ من المميزين\n\n ༄ " 
elseif msg.Creator then 
numowners = redis:scard(max..'owners:'..msg.chat_id_)
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• اهلين عيني "..msg.TheRankCmd.." ⇓\n• تــم تنزيل ❴ "..numowners.." ❵ من المدراء\n• تــم تنزيل ❴ "..numadmins.." ❵ من الادمنيه\n• تــم تنزيل ❴ "..numwhitelist.." ❵ من المميزين\n\n ༄ " 
elseif msg.Director then 
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• اهلين عيني "..msg.TheRankCmd.." ⇓\n• تــم تنزيل ❴ "..numadmins.." ❵ من الادمنيه\n• تــم تنزيل ❴ "..numwhitelist.." ❵ من المميزين\n\n ༄ " 
elseif msg.Admin then 
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• اهلين عيني "..msg.TheRankCmd.." ⇓\n• تــم تنزيل ❴ "..numwhitelist.." ❵ من المميزين\n\n ༄ " 
end
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(msg.chat_id_,msg.id_,"*•* هييه! العضو هذا مو موجود بالمجموعات \n❕") end
local UserID = data.sender_user_id_
msg = arg.msg
msg.UserID = UserID
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
msg = arg.msg
UserID = msg.UserID
if UserID == our_id then return sendMsg(msg.chat_id_,msg.id_,"*•* مايمديك تسوي الامر مع البوت\n❕") end

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(max..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 7
else
rinkuser = 8
end
local DonisDown = "\n• طيرناه من الرتب التاليه : \n\n "
if redis:sismember(max..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."المطور ✘\n"
end 
if redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك الاساسي  ✘️\n"
end 
if redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك ✘\n"
end 
if redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المدير ✘\n"
end 
if redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."الادمن ✘\n"
end 
if redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."العضو مميز ✘\n"
end
function senddwon() sendMsg(msg.chat_id_,msg.id_,"*•* هييه! رتبته اعلى منك مايمديك تنزله \n❕") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"*•* هييه! مايمديك تنزله رتبته مثل رتبتك : "..msg.TheRankCmd.." \n❕") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"• المستخدم  •❪ "..NameUser.." ❫   \nعضو من قبل \n༄")  end
huk = false
if msg.SudoBase then 
redis:srem(max..':SUDO_BOT:',UserID)
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Kara then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"• المستخدم  • ❪ "..NameUser.." ❫\n"..DonisDown.."\n༄") end

end,{msg=msg})
end,{msg=msg})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافي عضو بهذا المعرف \n❕") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي هذا الامر مع البوت\n❕") end

msg = arg.msg
NameUser = Hyper_Link_Name(data)

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(max..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 7
else
rinkuser = 8
end
local DonisDown = "\n• طيرناه من الرتب التاليه : \n\n "
if redis:sismember(max..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."المطور ✘\n"
end 
if redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك الاساسي ✘\n"
end 
if redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك ✘\n"
end 
if redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المدير ✘\n"
end 
if redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."الادمن ✘\n"
end 
if redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."العضو مميز ✘\n"
end

function senddwon() sendMsg(msg.chat_id_,msg.id_,"*•* هييه! رتبته اعلى منك مايمديك تنزله \n❕") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"*•* هييه! مايمديك تنزله رتبته مثل رتبتك : "..msg.TheRankCmd.." \n❕") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"• المستخدم  •❪ "..NameUser.." ❫   \nعضو من قبل \n༄")  end
huk = false
if msg.SudoBase then 
redis:srem(max..':SUDO_BOT:',UserID)
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Kara then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"• المستخدم  •❪ "..NameUser.." ❫ \n"..DonisDown.."\n༄") end

end,{msg=msg})
end 

if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwnAll"}) 
end

return false
end



--=====================================================================================

--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاق" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاق" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
if not redis:get(max..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(max..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(max..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"*•* تم وسوينا رابط جديد \n- ["..LinkGp.."]\n• عشان تشوفه ارسل { الرابط } \n𓄹𓄼")
else
return sendMsg(msg.chat_id_,msg.id_,"• لا يمكنني انشاء رابط للمجموعه .\n• لانني لست مشرف في المجموعه ")
end
else
return sendMsg(msg.chat_id_,msg.id_,"• تراك مسوي الرابط من قبل .\n• ارسل { الرابط } عشان تشوفه \n𓄹𓄼  ")
end
return false
end 
if MsgText[1] == "تعطيل الافلام" then 
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
sendMsg(msg.chat_id_, msg.id_, '⌯ تم تعطيل الافلام') 
redis:set(max.."BLACKBOTSS:movie_bot"..msg.chat_id_,"close") 
end 
if MsgText[1] == "تفعيل الافلام" then 
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
sendMsg(msg.chat_id_, msg.id_,'⌯ تم تفعيل الافلام') 
redis:set(max.."BLACKBOTSS:movie_bot"..msg.chat_id_,"open") 
end 
if MsgText[1] == 'فلم' and MsgText[2] and redis:get(max.."BLACKBOTSS:movie_bot"..msg.chat_id_) == "open" then 
data,res = https.request('https://forhassan.ml/Black/AWM.php?serch='..URL.escape(MsgText[2])..'') 
if res == 200 then 
getmo = json:decode(data) 
if getmo.Info == true then 
local Text ='قصه الفلم'..getmo.info 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'مشاهده الفلم بجوده 240',url=getmo.sd}}, 
{{text = 'مشاهده الفلم بجوده 480', url=getmo.Web},{text = 'مشاهده الفلم بجوده 1080', url=getmo.hd}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end 
end 
end

if MsgText[1] == "وضع رابط" then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
redis:setex(max..'linkGroup'..msg.sender_user_id_,300,true)
return '• ابشر ارسل الرابط الجديد ..'
end

if MsgText[1] == "الرابط" then
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "*•* معليش ، مافي رابط ): \n*•* عشان تسوي رابط ارسل { `انشاء رابط` }" 
end
local GroupName = redis:get(max..'group:name'..msg.chat_id_)
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
return "• رابـط الـمـجـمـوعة \n- "..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
if not GroupLink then return "*•* للاسف ، مافي هنا رابط\n• *اكتب [وضع رابط]*🔃" end
local Text = "• رابـط الـمـجـمـوعة \n• "..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "*•* معليش ياعيني \n• مايمديني ارسلك الرابط لانك حظرت البوت\n!"
elseif res == 400 then
return "*•* معليش ياعيني \n• ما امداني ارسلك الرابط لازم تراسل البوت اول \n!"
end
if res == 200 then 
return "*•* أهلا عيني "..msg.TheRankCmd.."  \n• تم ارسلت لك الرابط خاص \n𓄹𓄼"
end
end


if MsgText[1]== 'وضع قوانين' or MsgText[1] == "وضع القوانين" then
if not msg.Admin then return "*-›* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
redis:setex(max..'rulse:witting'..msg.sender_user_id_,300,true)
return '• تمام عيني  \n• الحين ارسل القوانين اللي ودك تحطها للمجموعة \n𓄹𓄼'
end

if MsgText[1] == "القوانين" then
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "*•* مرحبأ عزيري القوانين كلاتي 👇🏻\n• ممنوع نشر الروابط \n• ممنوع التكلم او نشر صور اباحيه \n• ممنوع  اعاده توجيه\n• ممنوع التكلم بلطائفه \n• الرجاء احترام المدراء والادمنيه\n𓄹𓄼"
else 
return "*• القوانين :*\n"..redis:get(max..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "وضع تكرار" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "*•* حدود التكرار ,  لازم تصير بين  *[2-50]*" 
end
redis:set(max..'flood'..msg.chat_id_,MsgText[2]) 
return "*•* تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
if 500 < tonumber(MsgText[2]) then return "*•* حدود المسح , لازم تصير  بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*•* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل \n𓄹𓄼  ")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*•* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل \n𓄹𓄼  ")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end

local Admins = redis:scard(max..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "*•* اوه ،  \n• معليش مافي ادمنيه عشان امسحهم \n𓄹𓄼" 
end
redis:del(max..'admins:'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• تم مسحت {"..Admins.."} واحد من الادمنيه  \n𓄹𓄼 "
end


if MsgText[2] == "قائمة المنع" then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
local Mn3Word = redis:scard(max..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "*•* معليش مافيه كلمات ممنوعه عشان احذفها \n𓄹𓄼" 
end
redis:del(max..':Filter_Word:'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• ابشر مسحت {*"..Mn3Word.."*} كلمة من المنع \n𓄹𓄼"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "• معليش مافي قوانين عشان امسحها \n!" 
end
redis:del(max..'rulse:msg'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• ابشر حذفت القوانين لعيونك \n"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
if not redis:get(max..'welcome:msg'..msg.chat_id_) then 
return "*•* اوه ،  \n• مافي ترحيب عشان اقدر امسحه \n𓄹𓄼" 
end
redis:del(max..'welcome:msg'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• تم حذفت الترحيب لعيونك \n"
end


if MsgText[2] == "المالك الاساسي" then
if not msg.SudoUser then return "*•* هذا الامر يخص {LEADER} بس " end
local NumMnsha = redis:scard(max..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "• مافيه مالك اساسي \n!" 
end
redis:del(max..':Hussain:'..msg.chat_id_)
return "*•* أهلين حبيبي "..msg.TheRankCmd.."   \n• تم مسح {* "..NumMnsha.." *} المالك الاساسي \n"
end


if MsgText[2] == "المالكين" then
if not msg.SudoUser then return "*•* هذا الامر يخص {LEADER} بس  " end
local NumMnsha = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "• معليش مافي مالكيين عشان امسحهم \n!" 
end
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• تم مسحت لك {* "..NumMnsha.." *} واحد من المالكين  \n"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
local NumMDER = redis:scard(max..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "• معليش مافيه مدراء عشان امسحهم \n!" 
end
redis:del(max..'owners:'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• تم مسحت لك {* "..NumMDER.." *} واحد من المدراء \n"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end

local list = redis:smembers(max..'banned:'..msg.chat_id_)
if #list == 0 then return "*• مافيه ناس محظورين  *" end
message = '*•* قائمة الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(max..'banned:'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• تم مسحت {* "..#list.." *} واحد من المحظورين \n"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
local MKTOMEN = redis:scard(max..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "*•* مافيه ناس مكتومه في المجموعة " 
end
redis:del(max..'is_silent_users:'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• تم مسحت {* "..MKTOMEN.." *} واحد من المكتومين \n"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
local MMEZEN = redis:scard(max..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*•* مافيه اشخاص مميزه في المجموعه " 
end
redis:del(max..'whitelist:'..msg.chat_id_)
return "*•* أهلين عيني "..msg.TheRankCmd.."   \n• تم مسحت لك {* "..MMEZEN.." *} واحد من المميزين \n"
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "*•* ي حلو مافيه رابط مضاف اصلا " 
end
redis:del(max..'linkGroup'..msg.chat_id_)
return "*•* اهلين عيني "..msg.TheRankCmd.."   \n• تم مسحت لك رابط المجموعه \n𓄹𓄼"
end


end 
--End del 



if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "• **هذا الامر يخص {LEADER,المنشئ} فقط  \n" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم مسح الصوره المجموعه .\n')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "• **هذا الامر يخص {LEADER,المنشئ} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'• تم تغيير صوره المجموعه\n')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'• ليس لدي صلاحيه تغيير الصوره \n• يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(max..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '• حسناً .\n• الان قم بارسال الصوره\n' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "• **هذا الامر يخص {LEADER,المنشئ} فقط  \n" end
redis:setex(max..'about:witting'..msg.sender_user_id_,300,true) 
return "• حسناً .\n• الان ارسل الوصف  للمجموعه\n" 
end





if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "*•* هذا الامر يخص {المالك,LEADER} بس  " end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"• مافيه بـوتـات في الـمـجـمـوعـة .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "• عـدد الـبـوتات •⊱ {* "..(Total - 1).." *} ⊰•\n\n"
if NumBot == 0 then 
TextR = TextR.."• مايمديني اطردهم لانهم مشرفين ."
else
if NumBotAdmin >= 1 then
TextR = TextR.."•  ما انطرد {* "..NumBotAdmin.." *} بوت لانهم مـشـرفين \n𓄹𓄼."
else
TextR = TextR.."• تم طـرد كــل البوتات  ."
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "*•* هذا الامر يخص {المالك,LEADER} بس  " end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '• قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

• عندك {]]..total..[[} بوتات
• ملاحظة : الـ ★ يعني ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "*•* هذا الامر يخص {المالك,LEADER} بس  " end
sendMsg(msg.chat_id_,msg.id_,'• جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(max..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(max..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(max..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"• تم طـرد {* "..NumMemDone.." *} من الحسابات المحذوفة‏‏ ..")
else
sendMsg(msg.chat_id_,msg.id_,'• مافيه حسابات محذوفه في المجموعه ..')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" or MsgText[1]:lower() == "الايدي" then
if not MsgText[2] and not msg.reply_id then
if redis:get(max..'lock_id'..msg.chat_id_) then 
local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
local url , res = https.request(ApiToken..'/getChat?chat_id='..msg.sender_user_id_)
if res == 200 then
local jsonn = JSON.decode(url)
bio = jsonn.result.bio
if jsonn.result.bio ~= nil then 
bio = bio
else
bio = 'لايوجد'
end
end
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(max.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {'والله انك جبر خاطر وجبر قلب وجبر حياه ',
		}
		ssssys = ali[math.random(#ali)]
		if not redis:get(max.."KLISH:ID"..msg.chat_id_) then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,' ↧'..ssssys..' \n 𖡋 : ʏᴏᴜʀ ɪᴅ ➪ '..msg.sender_user_id_..'\n 𖡋 : ᴜѕᴇʀɴᴀᴍᴇ ➪ '..UserNameID..'\n 𖡋 : ѕᴛᴀᴛѕ ➪ '..msg.TheRank..'\n 𖡋 : ᴍѕɢѕ ➪ '..msgs..'\n 𖡋 : ʙɪᴏ ➪ '..bio..'',dl_cb,nil)
		else
		Text = redis:get(max.."KLISH:ID"..msg.chat_id_)
		Text = Text:gsub('{الايدي}',msg.sender_user_id_)
		Text = Text:gsub('{اليوزر}',UserNameID)
		Text = Text:gsub('{الرتبه}',msg.TheRank)
		Text = Text:gsub('{التفاعل}',Get_Ttl(msgs))
		Text = Text:gsub('{الرسائل}',msgs)
		Text = Text:gsub('{التعديل}',rfih)
		Text = Text:gsub('{الجهات}',NumGha)
		Text = Text:gsub('{نقاطك}',nko)
		Text = Text:gsub('{البايو}',bio)
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,Flter_Markdown(Text),dl_cb,nil)
		end
	else
		if not redis:get(max.."KLISH:ID"..msg.chat_id_) then
		sendMsg(msg.chat_id_,msg.id_,' } مايمديني اطلع صورتك لانك يا حاظر البوت او ماحطيت صورة ...!\n 𖡋 : ʏᴏᴜʀ ɪᴅ ➪'..msg.sender_user_id_..' }\n 𖡋 : ᴜѕᴇʀɴᴀᴍᴇ ➪ {'..UserNameID..'}\n 𖡋 : ѕᴛᴀᴛѕ ➪ {'..msg.TheRank..'}\n 𖡋 : ᴍѕɢѕ ➪ {'..msgs..'}\n 𖡋 : ʙɪᴏ ➪ '..bio..'',dl_cb,nil)
		else
		Text = redis:get(max.."KLISH:ID"..msg.chat_id_)
		Text = Text:gsub('{الايدي}',msg.sender_user_id_)
		Text = Text:gsub('{اليوزر}',UserNameID)
		Text = Text:gsub('{الرتبه}',msg.TheRank)
		Text = Text:gsub('{التفاعل}',Get_Ttl(msgs))
		Text = Text:gsub('{الرسائل}',msgs)
		Text = Text:gsub('{التعديل}',rfih)
		Text = Text:gsub('{الجهات}',NumGha)
		Text = Text:gsub('{نقاطك}',nko)
		Text = Text:gsub('{البايو}',bio)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		end
	end
else
	if redis:get(max.."KLISH:ID"..msg.chat_id_) then
		Text = redis:get(max.."KLISH:ID"..msg.chat_id_)
		Text = Text:gsub('{الايدي}',msg.sender_user_id_)
		Text = Text:gsub('{اليوزر}',UserNameID)
		Text = Text:gsub('{الرتبه}',msg.TheRank)
		Text = Text:gsub('{التفاعل}',Get_Ttl(msgs))
		Text = Text:gsub('{الرسائل}',msgs)
		Text = Text:gsub('{التعديل}',rfih)
		Text = Text:gsub('{الجهات}',NumGha)
		Text = Text:gsub('{نقاطك}',nko)
		Text = Text:gsub('{البايو}',bio)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		else
		sendMsg(msg.chat_id_,msg.id_,'الايدي بالصوره معطل \n 𖡋 : ʏᴏᴜʀ ɪᴅ ➪ '..msg.sender_user_id_..' \n 𖡋 : ᴜѕᴇʀɴᴀᴍᴇ ➪ {'..UserNameID..'}\n 𖡋 : ѕᴛᴀᴛѕ ➪ {'..msg.TheRank..'}\n 𖡋 : ᴍѕɢѕ ➪ {'..msgs..'}\n 𖡋 : ʙɪᴏ ➪ '..bio..'',dl_cb,nil)
		end
end

end) 
end ,nil)
end
return false
end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n• ❪ احصائيات رسائلك ❫\n \n"
.."• الـرسـائـل ❪ "..msgs.." ❫\n"
.."• الـجـهـات ❪ "..NumGha.." ❫\n"
.."• لـصـور ❪ "..photo.." ❫\n"
.."• لـمـتـحـركـه ❪ "..animation.." ❫\n"
.."• الـمـلـصـقات ❪ "..sticker.." ❫\n"
.."• لـبـصـمـات ❪ "..voice.." ❫\n"
.."• الـصـوت ❪ "..audio.." ❫\n"
.."• لـفـيـديـو ❪ "..video.." ❫\n"
.."• الـتـعـديـل ❪ "..edited.." ❫\n"
.."• تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "*•* ي عيني ماعندك رسايل  " end
redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "*•* تم مسح {* "..msgs.." *} من رسائلك .."
end

if MsgText[1]== 'جهاتي' then
return '*•*  عدد جهاتك المضافه ❪ '..(redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "*•* معليش ماعندك جهات عشان امسحها" end
redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "*•* تم مسحت {* "..adduser.." *} من جهاتك"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n\n• اسمك الثاني  '..(data.last_name_ or ""),90)
local Get_info = "• سمك الاول  \n "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end


if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return "*•* معليش ماعندك مجوهرات عشان اقدر امسحها" end
redis:del(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "*•* تم مسح {* "..points.." *} من مجوهراتك"
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="• اهلين ياعيني هذي معلوماتك  \n"
..""
.."• الاســم ❪ "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." ❫\n"
.."• المعرف ❪ "..ResolveUser(data).." ❫\n"
.."• الايـدي ❪ `"..msg.sender_user_id_.."` ❫\n"
.."• رتبتــك ❪ "..msg.TheRank.." ❫\n"
.."• ـ ❪ `"..msg.chat_id_.."` ❫\n"
..""
.." ❪ الاحـصـائـيـات الـرسـائـل ❫\n"
.."• الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."• الجـهـات ❪ `"..NumGha.."` ❫\n"
.."• الـصـور ❪ `"..photo.."` ❫\n"
.."• الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."• لـمـلـصـقات ❪ `"..sticker.."` ❫\n"
.."• البـصـمـات ❪ `"..voice.."` ❫\n"
.."• الـصـوت ❪ `"..audio.."` ❫\n"
.."• الـفـيـديـو ❪ `"..video.."` ❫\n"
.."• الـتـعـديـل ❪`"..edited.."` ❫\n"
.."• تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(max..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(max..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(max..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(max..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(max..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(max..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="• اهلين عيني تم مسح كل معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end
if MsgText[1] == "تفعيل الردود العشوائيه" or MsgText[1] == "تفعيل الردود العشوائية" 	then print ("hi") return unlock_replayRn(msg) end
if MsgText[1] == "تعطيل الردود العشوائيه" or MsgText[1] == "تعطيل الردود العشوائية"	then return lock_replayRn(msg) end
if MsgText[1] == "تفعيل" then
if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "ردود المطور" 	then return unlock_replayall(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "ردود المطور" 	then return lock_replayall(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1]== 'وضع ترحيب' or MsgText[1] == "وضع الترحيب" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
redis:set(max..'welcom:witting'..msg.sender_user_id_,true) 
return "• تمام عيني  \n• ارسل كليشه الترحيب الحين\n\n• ملاحظة تقدر تضيف دوال للترحيب مثلا :\n• اظهار قوانين المجموعه  » *{القوانين}*  \n• اظهار الاسم العضو » *{الاسم}*\n• اظهار المعرف العضو » *{المعرف}*\n• اظهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if redis:get(max..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(max..'welcome:msg'..msg.chat_id_))
else 
return "*•* أهلا عيني "..msg.TheRankCmd.."  \n• منور  " 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "*•* هذا الامر يخص {المالك,LEADER} بس  " end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"*•* هذا الامر يخص {LEADER} بس  " end
local mtwren = redis:scard(max..':SUDO_BOT:')
if mtwren == 0 then  return "*•* معليش مافيه مطورين  ✖️" end
redis:del(max..':SUDO_BOT:') 
return "*•* تم مسح {* "..mtwren.." *} من المطورين ☔️"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمة العام"  then
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end
local addbannds = redis:scard(max..'gban_users')
if addbannds ==0 then 
return "*• قائمة الحظر فاضيه .*" 
end
redis:del(max..'gban_users') 
return "️*•* تـم مـسـح { *"..addbannds.." *} من قائمة العام" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" or MsgText[1] == "رفع المطور" then
if not msg.SudoBase then return "*•* هذا الامر يخص {LEADER} بس  " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 🗑" then
local groups = redis:smembers(max..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'*•* جـيـد , لا توجد مجموعات وهميه ')
else
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n*•* تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n*•* اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين 🗑" or MsgText[1] == "تنظيف المشتركين 🗑" then
local pv = redis:smembers(max..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(max..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'• جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n*•* تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n*•* اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "وضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(max..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'•› تمام عيني \n• الحين ارسل الصوره اللي تبيها للترحيب \n𓄹𓄼 ' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(max..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[• اهلين انا بوت واسمي ]]..redis:get(max..':NameBot:')..[[ 🧚‍♀️
• وظيفتي اساعدك على إدارة المجموعات وحمايتها
• من السبام والتوجيه والتكرار الخ..
• عشان تفعل البوت سوي هالخطوات 
1- ضيف البوت للمجموعة حقتك.
2- ارفع البوت مشرف في المجموعة.
3- حول سجل المحادثة من مخفي إلى ظاهر.
4- أرسل تفعيل في المجموعة وراح يتفعل البوت.
 • مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ 
]])

return false
else
return "• لا توجد صوره مضافه للترحيب في البوت \n• لاضافه صوره الترحيب ارسل `وضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(max..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '• تمام حبيبي \n• الحين قم بارسال الكليشه ' 
end
if MsgText[1] == "ضع كليشه السورس" then 
redis:setex(max..'text_sudo1:witting'..msg.sender_user_id_,1200,true) 
return '⇠ تمام عزيزي \n⇠ الحين قم بارسال الكليشه' 
end
  
if MsgText[1] == "مسح كليشه السورس" then 
if not redis:get(max..":TEXT_SUDO1") then
return '⇠ مافيه كليشه السورس اساساً' end
redis:del(max..':TEXT_SUDO1') 
return '⇠ اهلا عيني '..msg.TheRank..'\n⇠ ابشر مسحت كليشه السورس ' 
end
if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(max..':addnumberusers',MsgText[2]) 
return '*•* تم وضـع شـرط تفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..MsgText[2]..'】* عضـو ' 
end

if MsgText[1] == "شرط التفعيل" then 
return'*•* شـرط تفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..redis:get(max..':addnumberusers')..'】* عضـو ' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🌋" then
if not msg.SudoUser then return "*-›* هذا الامر يخص {LEADER} بس  " end
return '*•* عدد المجموعات المفعلة » `'..redis:scard(max..'group:ids')..'`  ➼' 
end

if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين Ⓜ" then
if not msg.SudoUser then return "*-›* هذا الامر يخص {LEADER} بس  " end
return '*•* عدد المشتركين في البوت : `'..redis:scard(max..'users')..'` '
end

if MsgText[1] == 'قائمة المجموعات' then 
if not msg.SudoBase then return "*•* هذا الامر يخص {LEADER} بس  " end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "*•* هذا الامر يخص {LEADER} بس  " end
if redis:sismember(max..'group:ids',MsgText[2]) then
local name_gp = redis:get(max..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'*•* تم تعطيل المجموعه بأمر من المطور  \n*-* معسلامه بطلع .')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '*•* تم تعطيل المجموعه ومغادرتها \n*•* المجموعة » ['..name_gp..']\n*•* الايدي » ( *'..MsgText[2]..'* )'
else 
return '*•* لا توجد مجموعه مفعله بهذا الايدي !\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(max..":TEXT_SUDO") or '• لا توجد كليشه المطور .\n• يمديك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n📡'
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
if not msg.SudoUser then return"*•* هذا الامر يخص {LEADER} بس  " end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه مقفوله من قبل LEADER 🚶" 
end
redis:setex(max..'fwd:'..msg.sender_user_id_,300, true) 
return "• حسننا الان ارسل التوجيه للاذاعه " 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then		
if not msg.SudoUser then return"*-›* هذا الامر يخص {LEADER} بس  " end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه مقفوله من قبل LEADER 🚶" 
end
redis:setex(max..'fwd:all'..msg.sender_user_id_,300, true) 
return "• حسننا الان ارسل الكليشه للاذاعه عام " 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 🗣" then		
if not msg.SudoUser then return "*-›* هذا الامر يخص {LEADER} بس  " end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه مقفوله من قبل LEADER 🚶" 
end
redis:setex(max..'fwd:pv'..msg.sender_user_id_,300, true) 
return "• حسننا الان ارسل الكليشه للاذاعه خاص "
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 🗣" then		
if not msg.SudoUser then return"*-›* هذا الامر يخص {LEADER} بس  " end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه مقفوله من قبل LEADER 🚶" 
end
redis:setex(max..'fwd:groups'..msg.sender_user_id_,300, true) 
return "• حسننا الان ارسل الكليشه للاذاعه للمجموعات " 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 🔥" then
if not msg.SudoUser then return"*-›* هذا الامر يخص {LEADER} بس  " end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمة العام" or MsgText[1]=="قائمه العام 📜" then 
if not msg.SudoUser then return"*-›* هذا الامر يخص {LEADER} بس  " end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "*•* هذا الامر يخص {LEADER} بس  " 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return '*•* رتبتك ❪ '..msg.TheRank..' ❫' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
redis:del(max..'welcom:witting'..msg.sender_user_id_,
max..'rulse:witting'..msg.sender_user_id_,
max..'rulse:witting'..msg.sender_user_id_,
max..'name:witting'..msg.sender_user_id_,
max..'about:witting'..msg.sender_user_id_,
max..'fwd:all'..msg.sender_user_id_,
max..'fwd:pv'..msg.sender_user_id_,
max..'fwd:groups'..msg.sender_user_id_,
max..'namebot:witting'..msg.sender_user_id_,
max..'addrd_all:'..msg.sender_user_id_,
max..'delrd:'..msg.sender_user_id_,
max..'addrd:'..msg.sender_user_id_,
max..'delrdall:'..msg.sender_user_id_,
max..'text_sudo:witting'..msg.sender_user_id_,
max..'addrd:'..msg.chat_id_..msg.sender_user_id_,
max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '*•* من عيوني الغيته'
end  


if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '-› اصدار سورس بيتر  : *v'..version..'* '
end

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس 🔂') then
if not msg.SudoBase then return "*•* هذا الامر يخص {LEADER} بس  " end
local GetVerison = https.request('https://github.com/MAXTELLE/max.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'*•* يوجد تحديث جديد الان \n*•* جاري تنزيل وتثبيت التحديث  ...')
redis:set(max..":VERSION",GetVerison)
return false
else
return "• الاصدار الحالي : *v"..version.."* \n*•* لديـك احدث اصدار"
end
return false
end

if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"*•* هذا الامر يخص {LEADER} بس  " end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "*•* هذا الامر يخص {LEADER} بس  " end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'*•* جاري رفع النسخه انتظر قليلا ... ️')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"*•* عذرا النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  ")
end
else 
sendMsg(msg.chat_id_,msg.id_,'*•* عذرا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس ماكس يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم ')
end  
else
sendMsg(msg.chat_id_,msg.id_,'*•* عذرا الملف ليس بصيغه Json !? ')
end 
else
sendMsg(msg.chat_id_,msg.id_,'*•* عذرا هذا ليس ملف النسحه الاحتياطيه للمجموعات ')
end 
end,nil)
else 
return "*•* ارسل ملف النسخه الاحتياطيه اولا\n*-* ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"*•* هذا الامر يخص {LEADER} بس  " end
return "• البوت شـغــال 🚀" 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي🆔") and msg.type == "pv" then return  "\n• اهلين حبيبي المطور ايديك هو ⏬\n\n- "..msg.sender_user_id_.."\n"  end

if MsgText[1]== " " and msg.type == "pv" then
local inline = {{{text=" ",url=" "}}}
send_key(msg.sender_user_id_,'  [ ]( )',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 💥" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"*•* هذا الامر يخص {LEADER} بس  " end
return '• لاحصائيات 🏌‍♂ \n\n*•* عدد المجموعات المفعله : '..redis:scard(max..'group:ids')..'\n*•* عدد المشتركين في البوت : '..redis:scard(max..'users')..' '
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام ➕" then
if not msg.SudoBase then return"*•* هذا الامر يخص {LEADER} بس  " end
redis:setex(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "• تمام ، الحين ارسل كلمة الرد العام"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
local names 	= redis:exists(max..'replay:'..msg.chat_id_)
local photo 	= redis:exists(max..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(max..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(max..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(max..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:'..msg.chat_id_,max..'replay_photo:group:'..msg.chat_id_,max..'replay_voice:group:'..msg.chat_id_,
max..'replay_animation:group:'..msg.chat_id_,max..'replay_audio:group:'..msg.chat_id_,max..'replay_sticker:group:'..msg.chat_id_,max..'replay_video:group:'..msg.chat_id_)
return "• تم مسح كل الردود"
else
return '*•* مافي ردود عشان امسحها'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'ردود المطور' then
if not msg.SudoBase then return"• للمطورين بس ! 💯" end
local names 	= redis:exists(max..'replay:all')
local photo 	= redis:exists(max..'replay_photo:group:')
local voice 	= redis:exists(max..'replay_voice:group:')
local imation 	= redis:exists(max..'replay_animation:group:')
local audio 	= redis:exists(max..'replay_audio:group:')
local sticker 	= redis:exists(max..'replay_sticker:group:')
local video 	= redis:exists(max..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:all',max..'replay_photo:group:',max..'replay_voice:group:',max..'replay_animation:group:',max..'replay_audio:group:',max..'replay_sticker:group:',max..'replay_video:group:')
return "•› تم مسح كل ردود المطور"
else
return "مافي ردود من المطور عشان امسحها ! "
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end
redis:set(max..'delrdall:'..msg.sender_user_id_,true) 
return "• تمام حبيبي \n- الحين ارسل الرد عشان امسحه من المجموعات .."
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
redis:set(max..'delrd:'..msg.sender_user_id_,true)
return "• تمام \n• الحين ارسل الرد عشان امسحه \n"
end
if (MsgText[1] == "فلم") then
if MsgText[2] and MsgText[2]:match("^فلم (.*)$") then 
data,res = https.request('https://forhassan.ml/Black/movie.php?serch='..URL.escape(MsgText[2])..'')
if res == 200 then
getmo = json:decode(data)
if getmo.Info == true then
local Text ='قصه الفلم'..getmo.info
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'مشاهده الفلم بجوده 240',url=getmo.sd}},
{{text = 'مشاهده الفلم بجوده 480', url=getmo.Web},{text = 'مشاهده الفلم بجوده 1080', url=getmo.hd}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end
if MsgText[1]== 'الردود' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
local names  	= redis:hkeys(max..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(max..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(max..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(max..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(max..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '*•* مافي ردود مضافه حاليا' 
end
local ii = 1
local message = '*•* ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه 🎙 ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== ' ردود المطور' or MsgText[1]=='الردود العامه 🗨' then
if not msg.SudoBase then return "-› للمطور بس ! 💯" end
local names 	= redis:hkeys(max..'replay:all')
local photo 	= redis:hkeys(max..'replay_photo:group:')
local voice 	= redis:hkeys(max..'replay_voice:group:')
local imation 	= redis:hkeys(max..'replay_animation:group:')
local audio 	= redis:hkeys(max..'replay_audio:group:')
local sticker 	= redis:hkeys(max..'replay_sticker:group:')
local video 	= redis:hkeys(max..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '*•* مافيه ردود مضافه حاليا ' 
end
local ii = 1
local message = '*•*ردود المطور في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه 🎙 ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end
----=================================|كود الرد العشوائي العام|===============================================

if MsgText[1]=="اضف رد عشوائي عام" then
if not msg.SudoUser then return "⇜ هذا الامر يخص ( المطور ) بس  \n" end
redis:setex(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:del(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return "⇜ تمام ,  الحين ارسل كلمة الرد للعشوائي العام \n༄ "
end



if MsgText[1]== "مسح رد عشوائي عام" then
if not msg.SudoUser then return "⇜ هذا الامر يخص ( المطور ) بس  \n" end
redis:setex(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,300,true)
return "⇜ تمام عيني  \n⇜ الحين ارسل الرد العشوائي العام عشاان امسحه \n༄ "
end

if MsgText[1] == "مسح الردود العشوائيه العامه" then
if not msg.SudoUser then return "⇜ هذا الامر يخص ( المطور ) بس  \n" end
local AlRdod = redis:smembers(max..':KlmatRRandom:') 
if #AlRdod == 0 then return "*⇜* الردود العشوائيه العامه محذوفه من قبل \n" end
for k,v in pairs(AlRdod) do redis:del(max..":ReplayRandom:"..v) redis:del(max..':caption_replay:Random:'..v)  end
redis:del(max..':KlmatRRandom:') 
return "*⇜* أهلا عيني "..msg.TheRankCmd.."  \n*⇜* مسحت كل الردود العشوائيه العامه \n༄ "
end

if MsgText[1] == "الردود العشوائيه العامه" then
if not msg.SudoUser then return "⇜ هذا الامر يخص ( المطور ) بس  \n" end
message = "*- الردود العشـوائيه العامه:*\n\n"
local AlRdod = redis:smembers(max..':KlmatRRandom:') 
if #AlRdod == 0 then 
message = message .."⇜ مافيه ردود عشوائيه عامه مضافه !\n"
else
for k,v in pairs(AlRdod) do
local incrr = redis:scard(max..":ReplayRandom:"..v) 
message = message..k..'- ['..v..'] ⇠ (*'..incrr..'*)  رد\n'
end
end
return message.."\n༄"
end

----=================================|نهايه كود الرد العشوائي العام|===============================================


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
redis:setex(max..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "• حلو , الحين ارسل الكلمة اللي تبيها"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end
redis:setex(max..'namebot:witting'..msg.sender_user_id_,300,true)
return"• تمام عيني \n• الحين ارسل الاسم  للبوت \n𓄹𓄼"
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/المطورEADER/null || cat /etc/*release 2>/المطورEADER/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 ❪ Seystem ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖 ❪ Memory ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾 ❪ HardDisk ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️ ❪ Processor ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*👨🏾‍🔧 ❪ Server[_]Login ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌 ❪ Uptime ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟l ❪ نظام التشغيل ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖l ❪ الذاكره العشوائيه ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾l ❪ وحـده الـتـخـزيـن ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️l ❪ الـمــعــالــج ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*👨🏾‍🔧l ❪ الــدخــول ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌l ❪ مـده تـشغيـل الـسـيـرفـر ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
local Text = [[
‏‎‏‌‌‏‌‌‌‌‏ ❨ ‌‌‏الاوامر العامة‌‏ ❩

• م1 ↢ اوامر الحماية‌‏
• م2 ↢ اوامر الاشراف 
• م3 ↢ اوامر التفعيل والتعطيل
• م4 ↢ اوامر الخدمة 
ـــــــــــــــــــــــــــــــــــــــــــــــ

「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ ](https://t.me/VV6YV)」  ]]

keyboard = {} 
keyboard.inline_keyboard = {
{{text="م1",callback_data="/m1:"..msg.sender_user_id_},{text="م2",callback_data="/m2:"..msg.sender_user_id_}},
{{text="م3",callback_data="/m3:"..msg.sender_user_id_},{text="م4",callback_data="/m4:"..msg.sender_user_id_}},
{{text="اوامر التحميل",callback_data="/music:"..msg.sender_user_id_}},
} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if MsgText[1]== 'م1' or MsgText[1]== 'م١' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end
local text =[[


❨ اوامر الحماية ❩

• قفل ↣ ↢ فتح  ❨ الكـــل ❩
• قفل ↣ ↢ فتح  ❨ التـاق ❩
• قفل ↣ ↢ فتح  ❨ الفيـديـــو ❩
• قفل ↣ ↢ فتح  ❨ الصــــــــور ❩
• قفل ↣ ↢ فتح  ❨ الملصقات ❩
• قفل ↣ ↢ فتح  ❨ المتحركه ❩
• قفل ↣ ↢ فتح  ❨ البصمــات ❩
• قفل ↣ ↢ فتح  ❨ الدردشـــه ❩
• قفل ↣ ↢ فتح  ❨ الــروابـــط ❩
• قفل ↣ ↢ فتح  ❨ البـــوتــات ❩
• قفل ↣ ↢ فتح  ❨ التعــديــل ❩
• قفل ↣ ↢ فتح  ❨ المعرفــات ❩
• قفل ↣ ↢ فتح  ❨ الكـــلايـش ❩
• قفل ↣ ↢ فتح  ❨ التـــكـــــرار ❩
• قفل ↣ ↢ فتح  ❨ الجــهـــــات ❩
• قفل ↣ ↢ فتح  ❨ الانـــلايــن ❩
• قفل ↣ ↢ فتح  ❨ التوجيــــه ❩
• قفل ↣ ↢ فتح  ❨ الدخول بالرابط ❩
• قفل ↣ ↢ فتح  ❨ البوتات بالطرد ❩
ـــــــــــــــــــــــــــــــــــــــــــــــ

❨ القفل بالتقييـد ❩

• قفل ↣ ↢ فتح ❨ الــصـور بالتقييـد ❩
• قفل ↣ ↢ فتح ❨ الــروابــط بالتقييـد ❩
• قفل ↣ ↢ فتح ❨ المتحركه بالتقييـد ❩
• قفل ↣ ↢ فتح ❨ الفيـديـو بالتقييد ❩
• قفل ↣ ↢ فتح ❨ التوجيـه بالتقييــد ❩

「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ](https://t.me/VV6YV)」  ]] 
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' or MsgText[1]== 'م٢' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end
local text = [[


❨ اوامر الرفع والتنزيل ❩

• رفع ↣ ↢ تنزيل ❨ مالك ❩
• رفع ↣ ↢ تنزيل ❨ مدير ❩
• رفع ↣ ↢ تنزيل ❨ ادمن ❩
• رفع ↣ ↢ تنزيل ❨ مميز ❩
ـــــــــــــــــــــــــــــــــــــــــــــــ

❨ اوامر الحظر والطرد والتقييد ❩

• حظر  ❨  بالرد أو بالمعرف ❩
• الغاء الحظر  ❨  بالرد أو بالمعرف ❩ 
• طرد   ❨ بالرد أو بالمعرف ❩
• كتم  ❨ بالرد أو بالمعرف ❩
• الغاء الكتم  ❨ بالرد أو بالمعرف ❩
• تقييد  ❨ بالرد أو بالمعرف ❩
• الغاء التقييد  ❨ بالرد أو بالمعرف ❩
• منع + الكلمة 
• الغاء منع + الكلمة



❨ اوامر المسح للمالك ❩

• مسح الادمنيـه «» لمسح ❨ الادمنيه ❩
• مسح المميزين «» لمسح ❨ المميزين ❩
• مسح المدراء «» لمسح ❨ المدراء ❩
ـــــــــــــــــــــــــــــــــــــــــــــــ

❨ اوامر الوضع ❩

• وضع رابط
• وضع قوانين
• وضع ترحيب
• وضع تكرار + العدد

「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ](https://t.me/VV6YV)」 ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' or MsgText[1]== 'م٣' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end
local text = [[


❨ اوامر التفعيل والتعطيل ❩

• تفعيل ↣ ↢ تعطيل  ❨ الرفــع ❩
• تفعيل ↣ ↢ تعطيل  ❨ الردود ❩
• تفعيل ↣ ↢ تعطيل  ❨ الالعـاب ❩
• تفعيل ↣ ↢ تعطيل  ❨ التحذير ❩
• تفعيل ↣ ↢ تعطيل  ❨ الترحيب ❩
• تفعيل ↣ ↢ تعطيل  ❨ الايدي ❩
• تفعيل ↣ ↢ تعطيل  ❨ الايدي بالصوره ❩
ـــــــــــــــــــــــــــــــــــــــــــــــ

❨ اوامر رؤية الاعدادات ❩

• الـرابـط ↢ لعرض ❨ الرابط ❩
• انشاء رابط ↢ لستخراج ❨ الرابط ❩
• الادمنيه ↢ لعرض ❨ الادمنيه ❩
• القوانين ↢ لعرض ❨ القوانين ❩
• الوسائط ↢ لعرض اعدادات ❨ الميديا ❩
• الحمايه ↢ لعرض كل ❨ الاعدادات ❩
• المــدراء ↢ لعرض ❨ الاداريين ❩
• المكتومين ↢ لعـرض ❨ المكتومين ❩
• المحظورين ↢ لعرض ❨ المحظورين ❩
• الاعدادات ↢ لعرض اعدادات ❨ المجموعه ❩
• المجموعه ↢ لعرض معلومات ❨ المجموعه ❩
• تغير امر + الامر ↢ لتغير  ❨ اوامر البوت ❩
• مسح امر + الامر ↢ لمسح  ❨ الامر المضاف ❩
• قائمة الاوامر ↢ لمعرفة  ❨ الاوامر المضافة ❩

「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ](https://t.me/VV6YV)」 ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' or MsgText[1]== 'م٤' then
if not msg.Director then return "*•* هذا الامر يخص {LEADER,المالك,المدير} بس  " end
local text = [[
❨ اوامر الخدمة ❩

• ايـــدي ↢ لعرض صورتك و معلوماتك
• ايديـي ↢ لعرض ايديك 
• ايدي بالرد ↢ لعرض ايدي الشخص
• الرابط ↢ استخراج رابط المجموعه
• جهاتي ↢ لمعرفه عدد جهاتك
• الالعاب ↢ لعرض الالعاب
• نقاطي ↢ لمعرفة مجوهراتك
• بيع نقاطي + العدد 
• معلوماتي ↢ لعرض معلوماتك
• الرتبه بالرد ↢ لمعرفه رتبه الشخص
• التفاعل بالمعرف ↢ لمعرفة تفاعل الشخص
• التفاعل بالــرد ↢ لمعرفة تفاعل الشخص
• كشف بالمعرف ↢ لمعرفه معلومات حسابه
• كشف بالرد ↢ لمعرفه معلومات حسابه
• طرد البوتات ↢ لطرد كل البوتات
• طرد المحذوفين ↢ لطرد الحسابات المحذوفه
• رابط الحذف ↢ لحذف حساب التليجرام

「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ](https://t.me/VV6YV)」 ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'التسليه' or MsgText[1]== 'التسلية' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end
local text =[[
❨ اوامر التسليه ❩

• اهلين عيني 
• هذي اوامر التسليه

• رفع ↣ ↢ تنزيل ❨ زق ❩
• رفع ↣ ↢ تنزيل ❨ كلب ❩
• رفع ↣ ↢ تنزيل ❨ حمار ❩
• رفع ↣ ↢ تنزيل ❨ ماعز ❩
• رفع ↣ ↢ تنزيل ❨ تاج ❩
• رفع ↣ ↢ تنزيل ❨ زوجتي ❩
• رفع ↣ ↢ تنزيل ❨ زاحف ❩
• رفع ↢ ❨ لقلبي ❩ تنزيل ↢ ❨ من قلبي ❩
•  ❨ طلاق ❩  ↣ ↢ ❨ زواج ❩

「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ](https://t.me/VV6YV)」 ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'اليوتيوب' or MsgText[1]== 'يوتيوب' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end
local text = [[
✶ اليـوتيوب
• امر التشغيل ❨ تفعيل اليوتيوب ❩
• امر التعطيل ❨ تعطيل اليوتيوب ❩

✶ البـحث عن اغنية ↓
• بحث + اسم الاغنية

مثال :

بحث + اسم الأغنيه



「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ ](https://t.me/VV6YV)」 ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'الساوند' or MsgText[1]== 'ساوند' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس  " end
local text = [[
✶ الساوند كلاود
• امر التشغيل ❨ تفعيل الساوند ❩
• امر التعطيل ❨ تعطيل الساوند ❩

✶ البـحث عن اغنية ↓

sn + رابط الاغنية

「[ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ ](https://t.me/VV6YV)」 ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس " end
if not redis:get(max..'lave_me'..msg.chat_id_) then 
return "*•* أهلين  "..msg.TheRankCmd.."\n*•* اطردني مفعله من قبل يالطيب \n" 
else 
redis:del(max..'lave_me'..msg.chat_id_) 
return "*•* أهلين  "..msg.TheRankCmd.."\n*•* تم تفعيل اطردني \n" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "*•* هذا الامر لــ {الادمن,المدير,المالك,LEADER} بس " end
if redis:get(max..'lave_me'..msg.chat_id_) then 
return "*•* أهلين  "..msg.TheRankCmd.."\n*•* اطردني معطله من قبل يالطيب \n " 
else
redis:set(max..'lave_me'..msg.chat_id_,true)  
return "*•* أهلين  "..msg.TheRankCmd.."\n*•* تم تعطيل اطردني \n" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(max..'lave_me'..msg.chat_id_) then
if msg.Admin then return "*•* للاسف مااقدر اطرد المدراء والادمنيه والمالكين   " end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"• هلا بالنفسية , طردتك من المجموعه عشانك طلبت \n• اذا كان ماقصدت او اذا تبي ترجع للمجموعة \n\n• فهذا هو الرابط  \n- "..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(max..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"• طردتك يانفسية , ارسلت لك الرابط خاص تقدر ترجع متى مابغيت يامعقد ")
else
sendMsg(msg.chat_id_,msg.id_,"• ما اقدر اطردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end

end 


if MsgText[1] == "التاريخ" then
return "➖\n• الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "تعديلاتي" then
return '*•* عدد تعديلاتك ⇜ ❪ '..(redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'تعديلاتي'  then
local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "*•* ي عيني ماعندك تعديلات  ️" end
redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "*•* تم مسح {* "..rfih.." *} من تعديلاتك .."
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end
if redis:get(max..":UserNameChaneel") then
return "• اهلا حبيبي المطور \n• الاشتراك بالتأكيد مفعل"
else
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "• اهلين فيك في نظام الاشتراك الاجباري\n• الحين ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري ♻️" then
if not msg.SudoBase then return"*•* هذا الامر يخص {LEADER} بس  " end
local SubDel = redis:del(max..":UserNameChaneel")
if SubDel == 1 then
return "• تم تعطيل الاشتراك الاجباري . "
else
return "• الاشتراك الاجباري بالفعل معطل . "
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري ⚠️" then
if not msg.SudoBase then return"*-›* هذا الامر يخص {LEADER} بس  " end
local UserChaneel = redis:get(max..":UserNameChaneel")
if UserChaneel then
return "• اهلين حبيبي المطور \n• الاشتراك الاجباري للقناة : ["..UserChaneel.."]"
else
return "• لا يوجد قناة مفعله ع الاشتراك الاجباري. "
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري 🔁" then
if not msg.SudoBase then return"*•* هذا الامر يخص {LEADER} بس  " end
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "• اهلين فيك في نظام الاشتراك الاجباري\n• الان ارسل معرف قـنـاتـك"
end





end

local function dmax(msg)



local getChatId = function(id)
  local chat = {}
  local id = tostring(id)
  if id:match("^-100") then
    local channel_id = id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getChannelFull = function(channel_id, cb)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb or dl_cb, nil)
end

local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end




local Text = msg.text
if Text then


if Text and (Text:match('(.*)')) and tonumber(msg.sender_user_id_) ~= 0 then
function dl_username(arg,data)
if data.username_ then
info = data.username_
else
info = data.first_name_
end
local hash = max..'user_names:'..msg.sender_user_id_
redis:set(hash,info)
end
getUser(msg.sender_user_id_,dl_username)
end

------set cmd------
Black = msg.text 
if Black == 'رفع مشرف بكامل الصلاحيات' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "• **هذا الامر يخص {المنشئ الاساسي,LEADER} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'• البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'• الأسم : '..data.first_name_..'\n• تم رفعته مشرف بكامل الصلاحيات\n‏‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'رفع مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "• **هذا الامر يخص {المنشئ الاساسي,LEADER} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'• البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'الأسم : '..data.first_name_..'\n• تم رفعه مشرف \n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "• **هذا الامر يخص {المنشئ الاساسي,LEADER} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'• البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'• الأسم : '..data.first_name_..'\nط• تم تنزله من الاشراف\n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false
end

if Black and (Black:match('^tr (.*)') or Black:match('^ترجم (.*)')) then 
bd = Black:match('^tr (.*)') or Black:match('^ترجم (.*)') 
url , res = https.request('https://api.codebazan.ir/lang/json/?matn='..bd..'') 
if res ~= 200 then 
end 
local jdat = json:decode(url)  
fa = jdat.result.fa or '---' 
en = jdat.result.en or '---' 
fr = jdat.result.fr or '---' 
ru = jdat.result.ru or '---' 
ar = jdat.result.ar or '---' 
zh = jdat.result.zh or '---' 
ja = jdat.result.ja or '---' 
de = jdat.result.de or '---' 
es = jdat.result.es or '---' 
tr = [[ 
 
ترجمة |]]..bd..[[| . 
-----------
🇮🇷 : Persian : ]]..fa..[[ 
🏴󠁧󠁢󠁥󠁮󠁧󠁿 : English : ]]..en..[[ 
🇫🇷 : Farance : ]]..fr..[[ 
🇷🇺 : Russia : ]]..ru..[[ 
🇸🇦 : Arabi : ]]..ar..[[  
🇨🇳 : China : ]]..zh..[[  
🇯🇵 : Japon : ]]..ja..[[  
🇩🇪 : Almani : ]]..de..[[  
🇪🇸 : Spani : ]]..es..[[ 
 

]] 
sendMsg(msg.chat_id_,msg.id_,tr) 
end
mmd = redis:get(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(max..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(max..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'• اهلين عيني \n• تم تثبيت الامر الجديد \n𓄹𓄼')
redis:del(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end


if Black:match('^تغيير امر (.*)') then
if not msg.Kara then return "*•* هذا الامر يخص {المالك,المطور,LEADER} بس  " end
local cmd = Black:match('^تغيير امر (.*)') 
redis:setex(max..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'• اهلين عيني\n• الامر الي تبي تغيره بدال  ❨'..cmd..'❩ \n• ارسله الحين \n𓄹𓄼')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.Kara then return "*•* هذا الامر يخص {المالك,المطور,LEADER} بس  " end
local cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(max..'CmD:'..msg.chat_id_,cmd)
redis:srem(max..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"\n𓄹𓄼 اهلا عيني\nالامر >"..cmd.."\n• تم مسحه من قائمة الاوامر \n𓄹𓄼")
end
if Black == 'مسح قائمة الاوامر' or Black == 'مسح قائمة الاوامر' then
if not msg.Kara then return "*•* هذا الامر يخص {المالك,المطور,LEADER} بس  " end
redis:del(max..'CmD:'..msg.chat_id_)
redis:del(max..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"• اهلا عيني تم مسح قائمة الاوامر")
end
if Black == "قائمة الاوامر" then
if not msg.Kara then return "*•* هذا الامر لــ {المالك,المطور,LEADER} بس  " end
local CmDlist = redis:smembers(max..'CmDlist:'..msg.chat_id_)
local t = '• قائمة الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(max..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '•  تراك ما اضفت ولا امر !'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if not msg.Admin then return sendMsg(msg.chat_id_,msg.id_,"*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس") end
if redis:get(max..'welc'..msg.chat_id_) then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب سابقا')
else
redis:set(max..'welc'..msg.chat_id_,'on')
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if not msg.Admin then return sendMsg(msg.chat_id_,msg.id_,"*•* هذا الامر يخص {الادمن,المدير,المالك,LEADER} بس") end
if not redis:get(max..'welc'..msg.chat_id_) then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب سابقا')
else
redis:del(max..'welc'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب')
end
end




if Text == "join on" and msg.SudoUser then
redis:set(max..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(max..'setchs') and msg.SudoUser then
redis:set(max..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(max..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUser then
sendMsg(msg.chat_id_,msg.id_,'ارسل معرفك بدون @')
redis:setex(max..'setchs',120,true)
end


if Text == 'time' or Text == 'الوقت' and is_JoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^تحويل ملصق$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'• عيني \n• الامر بس للصوره')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

  if Text == 'tophoto' or Text == 'صوره' and tonumber(msg.reply_to_message_id_) > 0 then
  function tophoto(kara,max)   
  if max.content_.ID == "MessageSticker" then        
local bd = max.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'• عيني \n• الامر بس للملصق')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(max..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*•* تم حظرك من البوت بسبب البثاره يابثر') 
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then 

if msg.SudoBase then
local text = '-› نورت حبيبي المطور '
local keyboard = {
{"ضع اسم للبوت ©","ضع صوره للترحيب 🌄"},
 {"تعطيل التواصل ✖️","تفعيل التواصل 🔛"},
{"تعطيل البوت خدمي","تفعيل البوت خدمي","المطورين 🔥"},
 {"المشتركين Ⓜ","المجموعات 🌋","الاحصائيات 💥"},
 {"اضف رد عام ➕","الردود العامه 🗨"},
 {"اذاعه 🗣","اذاعه خاص 🗣"},
{"اذاعه عام 📢","اذاعه عام بالتوجيه 📣"},
 {"تحديث ♻️","قائمه العام 📜","ايديي🆔"},
{"تعطيل الاشتراك الاجباري ♻️","تفعيل الاشتراك الاجباري ☑"},
{"تغيير الاشتراك الاجباري 🔁","الاشتراك الاجباري ⚠️"},
{"تنظيف المشتركين 🗑","تنظيف المجموعات 🗑"},
 {"نسخه احتياطيه للمجموعات"},
 {"الغاء الامر ✖️"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(max..'users',msg.sender_user_id_)
if redis:get(max..'lock_service') then 
text = [[• اهلين انا بوت واسمي []]..redis:get(max..':NameBot:')..[[] 🧚‍♀️
• وظيفتي اساعدك على إدارة المجموعات وحمايتها
• من السبام والتوجيه والتكرار الخ..
• عشان تفعل البوت سوي هالخطوات 
1- ضيف البوت للمجموعة حقتك.
2- ارفع البوت مشرف في المجموعة.
3- حول سجل المحادثة من مخفي إلى ظاهر.
4- أرسل تفعيل في المجموعة وراح يتفعل البوت.
━┉ ┉ ┉ ┉ ┉ ┉ ┉━
• مطوري  ]]..SUDO_USER..[[
]]
else
text = [[• اهلين انا بوت واسمي []]..redis:get(max..':NameBot:')..[[] 🧚‍♀️
• وظيفتي اساعدك على إدارة المجموعات وحمايتها
• من السبام والتوجيه والتكرار الخ..
• عشان تفعل البوت سوي هالخطوات 
1- ضيف البوت للمجموعة حقتك.
2- ارفع البوت مشرف في المجموعة.
3- حول سجل المحادثة من مخفي إلى ظاهر.
4- أرسل تفعيل في المجموعة وراح يتفعل البوت.
━┉ ┉ ┉ ┉ ┉ ┉ ┉━
• مطوري  ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="المطور",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoUser then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(max.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"• تم ارسال الرسالة ..\n• الى : "..USERNAME.." 🏌🏻",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(max..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"-› هييه! مايمديك ترسل { توجيه‌‏ أو مـلصـق أو فيديو كام} ❗️")
return false
end
redis:setex(max.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"• ابشر بتوصل رسالتك للمطور  ")
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end
function CaptionInsert(msg,input,public)
if msg.content_ and msg.content_.caption_ then 
if public then
redis:hset(max..':caption_replay:Random:'..msg.klma,input,msg.content_.caption_) 
else
redis:hset(max..':caption_replay:Random:'..msg.chat_id_..msg.klma,input,msg.content_.caption_) 
end
end
end
--====================== Reply Random Public =====================================
if redis:get(max..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then
klma = redis:get(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
msg.klma = klma
if msg.text == "تم" then
redis:del(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_)
redis:del(max..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'⇜ واضفنا الردود العشوائية العامه ياحلو \n⇜ ارسل *('..klma..')* عشان تشوفها \n༄ ')
redis:del(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end

local CountRdod = redis:scard(max..':ReplayRandom:'..klma) or 1
local CountRdod2 = 1000 - tonumber(CountRdod)
local CountRdod = 999 - tonumber(CountRdod)
if CountRdod2 == 0 then 
redis:del(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_)
redis:del(max..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'⇜ وصلت الحد الاقصى لعدد الردود العامه \n⇜ ارسل *('..klma..')* عشان تشوفها \n༄ ')
redis:del(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end
if msg.text then 
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"⇜ معليش مو مسموح تضيف جواب الرد اكثر من 4000 حرف الغيت الامر \n ")
end
CaptionInsert(msg,msg.text,true)
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Text:"..msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا الرد العام باقي '..CountRdod..'\n⇜ ارسل رد ثاني او ارسل (*تم*) \n༄ ')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Photo:"..photo_id) 
CaptionInsert(msg,photo_id,true)
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا الصوره للرد العام باقي '..CountRdod..' \n⇜ ارسل رد ثاني او ارسل (*تم*) \n༄')
elseif msg.content_.ID == "MessageVoice" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Voice:"..msg.content_.voice_.voice_.persistent_id_) 
CaptionInsert(msg,msg.content_.voice_.voice_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا البصمه للرد العام باقي '..CountRdod..' \n⇜  ارسل رد ثاني او ارسل (*تم*) \n༄')
elseif msg.content_.ID == "MessageAnimation" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Animation:"..msg.content_.animation_.animation_.persistent_id_) 
CaptionInsert(msg,msg.content_.animation_.animation_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا المتحركه للرد العام العام باقي '..CountRdod..' \n⇜ ارسل رد ثاني او ارسل (*تم*) \n༄')
elseif msg.content_.ID == "MessageVideo" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Video:"..msg.content_.video_.video_.persistent_id_) 
CaptionInsert(msg,msg.content_.video_.video_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا الفيديو للرد العام باقي '..CountRdod..' \n⇜ ارسل رد ثاني او ارسل (*تم*) \n༄')
elseif msg.content_.ID == "MessageAudio" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Audio:"..msg.content_.audio_.audio_.persistent_id_) 
CaptionInsert(msg,msg.content_.audio_.audio_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا الصوت للرد العام باقي '..CountRdod..' \n⇜ ارسل رد ثاني او ارسل (*تم*) \n༄ ')
elseif msg.content_.ID == "MessageDocument" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Document:"..msg.content_.document_.document_.persistent_id_) 
CaptionInsert(msg,msg.content_.document_.document_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا الملف للرد العام باقي '..CountRdod..' \n⇜ ارسل رد ثاني او ارسل (*تم*) \n༄')  
elseif msg.content_.ID == "MessageSticker" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Sticker:"..msg.content_.sticker_.sticker_.persistent_id_) 
CaptionInsert(msg,msg.content_.sticker_.sticker_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'⇜ وحطينا الملصق للرد العام باقي '..CountRdod..' \n⇜ ارسل رد ثاني او ارسل (*تم*) \n༄ ')
end  

end
--====================== End Reply Random Public =====================================
--====================== Reply Only Group ====================================
if redis:get(max..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(max..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  • تم اضافة الرد ')
elseif msg.photo then 
redis:hset(max..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الصوره للرد ياحلو ✓\n• يمديك ترسل ❴ ['..klma..'] ❵ عشان تشوف الصوره  ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة بصمه صوت للرد ياحلو ✓\n• يمديك ترسل ❴ ['..klma..'] ❵ عشان تسمع البصمه  ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة المتحركه للرد ياحلو ✓\n• يمديك ترسل ❴ ['..klma..'] ❵ عشان تشوف الصوره المتحركه ')
elseif msg.video then
redis:hset(max..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الفيديو للرد ياحلو ✓\n• يمديك ترسل ❴ ['..klma..'] ❵ عشان تشوف الفيديو  ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الصوت للرد ياحلو ✓\n• يمديك ترسل ❴ ['..klma..'] ❵ عشان تسمع الصوت  ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الملصق للرد ياحلو ✓\n• يمديك ترسل ❴ ['..klma..'] ❵ عشان تشوف الملصق  ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(max..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  • تم اضافة الرد لكل المجموعات  ')
elseif msg.photo then 
redis:hset(max..'replay_photo:group:',klma,photo_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه صوره للرد العام ✓\n- يمكنك ارسال ❴ ['..klma..'] ❵ لاظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:',klma,voice_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه بصمه صوت للرد العام ✓\n- يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:',klma,animation_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه متحركه للرد العام ✓\n- يمكنك ارسال ❴ ['..klma..'] ❵ لاظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(max..'replay_video:group:',klma,video_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه فيديو للرد العام ✓\n- يمكنك ارسال ❴ ['..klma..'] ❵لاظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:',klma,audio_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه للصوت للرد العام ✓\n- يمكنك ارسال ❴ ['..klma..'] ❵ لاظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:',klma,sticker_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه ملصق للرد العام ✓\n- يمكنك ارسال ❴ ['..klma..'] ❵ لاظهار الملصق الاتي ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
local Text = msg.text
local UserID =  msg.sender_user_id_
if msg.Creator then
if Text == "تعيين الايدي" then
redis:setex(max.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
local hasnid= [[
⇜ تمام , الحين ارسل كليشه الايدي الجديده 
 مع العلم ان الاختصارات كالاتي : 
 
{الايدي} ➪ لوضع ايدي المستخدم
{اليوزر} ➪ لوضع معرف المستخدم 
{الرتبه}  ➪ لوضع نوع رتبه المستخدم 
{التفاعل} ➪ لوضع تفاعل المستخدم 
{الرسائل} ➪ لاظهار عدد الرسائل 
{نقاطك} ➪ لاظهار عدد المجوهرات 
{التعديل} ➪ لاظهار عدد التعديلات  
{البايو} ➪ لاظهار بايو المستخدم

༄
]]
return sendMsg(msg.chat_id_,msg.id_,hasnid) 
end
if Text == "مسح الايدي" and msg.SudoUser then
redis:del(max.."KLISH:ID"..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم  حذف كليشه الايدي ")
return false  
end
if redis:get(max.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if Text == "الغاء" then 
sendMsg(msg.chat_id_,msg.id_,"*• تم الغاء الامر *")
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end 
redis:del(max.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = Text:match("(.*)")  
redis:set(max.."KLISH:ID"..msg.chat_id_,CHENGER_ID)
sendMsg(msg.chat_id_,msg.id_,'\n*• تم تغير كليشه الايدي بنجاح*\n')
end

end

if msg.content_.ID == "MessageChatAddMembers" then  
redis:set(max.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = redis:get(max.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
BESSO = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(BESSO)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end

if text == 'مين ضافني' then
if not redis:get(max..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,'• انت مالك المجموعة ') 
return false
end
local Added_Me = redis:get(max.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '• الشخص اللي اضافك هو » '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,'• انت دخلت من الرابط') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,'• امر مين ضافني تم تعطيله من المدراء ') 
end
end

if text == "تفعيل ضافني" then   
if redis:get(max..'Added:Me'..msg.chat_id_) then
sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."\n*•* ابشر تم تفعيل امر مين ضافني \n𓄹𓄼")
redis:del(max..'Added:Me'..msg.chat_id_)  
else
sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."\n*•* امر مين ضافني مفعل من قبل \n𓄹𓄼 ")
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ضافني' then  
if not redis:get(max..'Added:Me'..msg.chat_id_) then
redis:set(max..'Added:Me'..msg.chat_id_,true)  
sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."\n*•* ابشر تم تعطيل امر مين ضافني \n𓄹𓄼")
else
sendMsg(msg.chat_id_,msg.id_,"*•* أهلين عيني "..msg.TheRankCmd.."\n*•* امر مين ضافني معطل من قبل \n𓄹𓄼")
end
send(msg.chat_id_, msg.id_,Text) 
end

if redis:get(max..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(max..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"• معليش , فيه خطأ  \n• المعرف اللي ارسلته مو معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"• معليش , لقد نسيت شيئا \n- يجب رفع البوت مشرف في قناتك عشان تقدر تفعل الاشتراك الاجباري .")
return false
end
else
redis:set(max..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"• حلو , الحين لقد تم تفعيل الاشتراك الاجباري\n- على قناتك ⇜ ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"• معليش , عزيزي المطور \n- هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(max..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(max..'namebot:witting'..msg.sender_user_id_)
redis:set(max..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"• تم تغير اسم البوت \n• الحين اسمه "..Flter_Markdown(msg.text).." ")
return false
end

if redis:get(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
redis:setex(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"• تمام , الحين ارسل جواب الردالعام \n- [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]")
end
end

if redis:get(max..'delrdall:'..msg.sender_user_id_) then
redis:del(max..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(max..'replay:all',msg.text)
local photo =redis:hget(max..'replay_photo:group:',msg.text)
local voice = redis:hget(max..'replay_voice:group:',msg.text)
local animation = redis:hget(max..'replay_animation:group:',msg.text)
local audio = redis:hget(max..'replay_audio:group:',msg.text)
local sticker = redis:hget(max..'replay_sticker:group:',msg.text)
local video = redis:hget(max..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'*•* هذاالرد مو موجود في قائمة الردود')
else
redis:hdel(max..'replay:all',msg.text)
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n •ابشر تم مسح الرد  ')
end 
end 


if redis:get(max..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(max..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(max..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "*•* تم وضع الكليشه بنجاح كلاتي 👋🏻\n\n*{*  "..Flter_Markdown(msg.text).."  *}*")
end
if redis:get(max..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(max..'welcom:witting'..msg.sender_user_id_) 
redis:set(max..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"*•* تم وسوينا الترحيب يابعدي" )
end
if redis:get(max..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(max..'rulse:witting'..msg.sender_user_id_) 
redis:set(max..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'*•*  اهلين عيني\n• القوانين سويناها ✓\n• ارسل [[ القوانين ]] عشان تشوفها')
end
if redis:get(max..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(max..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(max..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(max..'linkGroup'..msg.sender_user_id_,link) 
redis:set(max..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'• تم وسوينا الرابط الجديد  .. ')
end


if redis:get(max..'text_sudo1:witting'..msg.sender_user_id_) then  

redis:del(max..'text_sudo1:witting'..msg.sender_user_id_) 

redis:set(max..':TEXT_SUDO1',Flter_Markdown(msg.text))
return 
sendMsg(msg.chat_id_,msg.id_, "⇠ تم سويت الكليشه  \n\n*{*  "..Flter_Markdown(msg.text).."  *}* ")

end

if redis:get(max..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(max..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"*•* تم ياعيني وحطينا الوصف الجديد")
end 
end,nil)
end


if redis:get(max..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(max..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')  
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا حبيبي المطور \n- جاري  نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(max..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'*•* تم اذاعه الكليشه بنجاح \n*•*للمـجمـوعآت » ❴ *'..#groups..'* ❵ قروب \n*•* للمـشـتركين » ❴ '..#pv..' ❵ مـشـترك')
end

if redis:get(max..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(max..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا عزيزي المطور \n- جاري  نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(max..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المشتركين : ❴ '..#pv..' ❵\n*•* تم الاذاعه الى ❴ '..SenderOk..'  ❵ مشترك') 
end
end)
end
end

if redis:get(max..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(max..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(max..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• هلا عزيزي المطور \n- جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '*•* تم حذف ❴ *'..NumGroupsDel..'* ❵ من قائمة الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المجموعات ❴ *'..#groups..'* ❵\n*•* تـم الاذاعه الى ❴ *'..AllGroupSend..'* ❵\n'..MsgTDel..'✓')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(max..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(max..':WELCOME_BOT'),[[-› اهلا انآ بوت آسـمـي ]]..redis:get(max..':NameBot:')..[[ ✓
• آختصـآصـي حماية المجموعات
• مـن آلسـبآم والتكرار وآلخ...

• الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
]])
return false
end 

if msg.forward_info and redis:get(max..'fwd:'..msg.sender_user_id_) then
redis:del(max..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا عيني المطور \n- جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'*•* تم اذاعه التوجيه بنجاح \n*•* للمجموعات » ❴ *'..#groups..'* ❵\n*•* للخاص » ❴ '..#pv..' ❵\n✓')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." اطلع$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'• ابشر')
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.ID == "MessagePhoto" and redis:get(max..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(max..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(max..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'• تم تغيير صورة‏‏ الترحيب للبوت ')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(max..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(max..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'• ليس لدي صلاحيه تغيير الصوره \n• يجب اعطائي صلاحيه `تغيير معلومات المجموعه `')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(max..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(max..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(max..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"• تمام , الحين ارسل الجواب اللي تبيه للرد \n- [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]")
end
end

if redis:get(max..'delrd:'..msg.sender_user_id_) then
redis:del(max..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(max..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(max..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(max..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(max..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(max..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(max..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد مو مضاف في قائمة الردود ')
else
redis:hdel(max..'replay:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(max..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n  • تم مسح الرد ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(max..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"*•* معليش التثبيت مقفل من الاداره تم ارجاع التثبيت القديم")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"*•* معليش التثبيت مقفل من الاداره تم ارجاع التثبيت القديم")      
end
end,nil)
end
return false
end
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغيير صورة المجموعة ✓\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(max..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"• قام  ["..UserName.."]\n• بتغيير اسم المجموعه  ✋\n• الى "..Flter_Markdown(msg.content_.title_).." ") 
end)
end
if msg.content_.ID == "MessageChatAddMembers" and redis:get(max..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(max..'welcome:get'..msg.chat_id_)
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end
  
if msg.content_.ID == "MessageChatAddMembers" and redis:get(max..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(max..'welcome:get'..msg.chat_id_)
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if (msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink") then
if redis:get(max..'welc'..msg.chat_id_) then
if msg.adduserType then
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "- أهلاًً حبيبي\n-نورت المجموعة .")
welcome = welcome:gsub("{القوانين}", redis:get(max..'rulse:msg'..msg.chat_id_) or "- الابتعاد عن الألفاظ القذرة.\n- الابتعاد عن العنصرية.\n- عدم نشر صور ومقاطع غير اخلاقية.\n- احترام مالك القروب واعضاء القروب.")
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف ' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
return false
else
GetUserID(msg.sender_user_id_,function(arg,data)
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "- أهلاًً حبيبي\n-نورت المجموعة .")
welcome = welcome:gsub("{القوانين}", redis:get(max..'rulse:msg'..msg.chat_id_) or "- الابتعاد عن الألفاظ القذرة.\n- الابتعاد عن العنصرية.\n- عدم نشر صور ومقاطع غير اخلاقية.\n- احترام مالك القروب واعضاء القروب.")
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف ' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome)) 
end)
end 
end 
return false
end

--------------------------------------------
if msg.adduser and redis:get(max..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(max..'welcome:get'..msg.chat_id_)
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(max..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(max..'num_msg_max'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(max..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"-› العضو "..USERNAME.."\n• تراك دوختنا وارسلت اكثر من "..NUM_MSG_MAX.." رسالة , عشان كذا قيدناك يابثر‌‏ ✓",12,USERCAR) 
return false
end)
end 
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'• صلاحياته منشئ القروب \n ')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'• مجرد عضو هنا \n ')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'• الرتبة : مشرف \n• لصلاحيات هي ⇓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n• تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n• حذف الرسائل ↞ ❪ '..delete..' ❫\n• حظر المستخدمين ↞ ❪ '..restrict..' ❫\n• دعوة مستخدمين ↞ ❪ '..invite..' ❫\n• تثبيت الرسائل ↞ ❪ '..pin..' ❫\n• اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n• ملاحظه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(max..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'*•* ترا مايمديني امسح الرسالة المخالفة .\n*•* لاني مو مشرفه او ماعندي صلاحية الحذف ! \n𓄹𓄼')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) and not redis:get(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع اعادة التوجيه  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
--SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*-* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(max..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• معليش الانلاين مقفول  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل بس
if utf8.len(msg.text) > 500 and redis:get(max..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ممنوع ترسل الكليشه ولا بتجبرني اشوتك  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(max..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*-* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(max..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل روابط  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل روابط الويب   "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(max..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل تاق "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل معرف   "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(max..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الماركدوان  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل روابط الويب   "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(max..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع التعديل راح امسح كلامك  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(max..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الفيديو كام "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(max..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الصور  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
elseif redis:get(max..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(max..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "-› ي عيني ممنوع ترسل الفيديو  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(max..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الملفات  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)
end
end)
return false
elseif msg.sticker and redis:get(max..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الملصقات  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(max..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الصور المتحركه  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)   
end
end)
return false
elseif redis:get(max..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(max..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل جهات الاتصال  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
elseif msg.location and redis:get(max..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الموقع  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
elseif msg.voice and redis:get(max..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل البصمات  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)   
end
end)
return false
elseif msg.game and redis:get(max..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• يالطيب ! الالعاب مقفله الحين  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
elseif msg.audio and redis:get(max..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل صوت  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(max..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• معليش الكيبورد مقفل  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(max..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف \n ??')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل الروابط هنا "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(max..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ي عيني ممنوع ترسل روابط الويب هنا "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
 end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(max..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
local msgx = "• ي عيني ممنوع ترسل التاق او المعرف هنا "
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text then
GetUserID(msg.sender_user_id_,function(arg,data)
local Replay = false
local Replay = 0
Replay = redis:smembers(max..':ReplayRandom:'..msg.text) 
if #Replay ~= 0 then 
local Replay = Replay[math.random(#Replay)]
Replay = convert_Klmat(msg,data,Replay,true)
local CaptionFilter = Replay:gsub(":Text:",""):gsub(":Document:",""):gsub(":Voice:",""):gsub(":Photo:",""):gsub(":Animation:",""):gsub(":Audio:",""):gsub(":Sticker:",""):gsub(":Video:","")
Caption = redis:hget(max..':caption_replay:Random:'..msg.text,CaptionFilter)
Caption = convert_Klmat(msg,data,Caption)
if Replay:match(":Text:") then
return sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay:gsub(":Text:","")))
elseif Replay:match(":Document:") then 
return sendDocument(msg.chat_id_,msg.id_,Replay:gsub(":Document:",""),Caption)  
elseif Replay:match(":Photo:") then 
return sendPhoto(msg.chat_id_,msg.id_,Replay:gsub(":Photo:",""),Caption)  
elseif Replay:match(":Voice:") then 
return sendVoice(msg.chat_id_,msg.id_,Replay:gsub(":Voice:",""),Caption)
elseif Replay:match(":Animation:") then 
return sendAnimation(msg.chat_id_,msg.id_,Replay:gsub(":Animation:",""),Caption)  
elseif Replay:match(":Audio:") then 
return sendAudio(msg.chat_id_,msg.id_,Replay:gsub(":Audio:",""),"",Caption)  
elseif Replay:match(":Sticker:") then 
return sendSticker(msg.chat_id_,msg.id_,Replay:gsub(":Sticker:",""))  
elseif Replay:match(":Video:") then 
return sendVideo(msg.chat_id_,msg.id_,Replay:gsub(":Video:",""),Caption)
end
end

end)


local Replay = false

 Replay = redis:hget(max..'replay:all',msg.text)
if Replay and not redis:get(max..'replayall'..msg.chat_id_) then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(max..'replay:'..msg.chat_id_,msg.text)
if Replay and redis:get(max..'replay'..msg.chat_id_) then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(max..'replay_photo:group:',msg.text)
if Replay and not redis:get(max..'replayall'..msg.chat_id_) then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_voice:group:',msg.text)
if Replay and not redis:get(max..'replayall'..msg.chat_id_) then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(max..'replay_animation:group:',msg.text)
if Replay and not redis:get(max..'replayall'..msg.chat_id_) then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_audio:group:',msg.text)
if Replay and not redis:get(max..'replayall'..msg.chat_id_) then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_sticker:group:',msg.text)
if Replay and not redis:get(max..'replayall'..msg.chat_id_) then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_video:group:',msg.text)
if Replay and not redis:get(max..'replayall'..msg.chat_id_) then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(max..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(max..'replay'..msg.chat_id_) then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(max..'replay'..msg.chat_id_) then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(max..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(max..'replay'..msg.chat_id_) then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(max..'replay'..msg.chat_id_) then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(max..'replay'..msg.chat_id_) then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(max..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(max..'replay'..msg.chat_id_) then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end
--=============================================================================================================================
if msg.SudoUser and msg.text and redis:get(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_) then 
if not redis:get(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then return sendMsg(msg.chat_id_,msg.id_,"⇜ معليش مو مسموح تضيف اكثر من 25 حرف كلمة رد \n ") end
redis:setex(max..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"⇜ حلو , الحين ارسل جواب الرد العشوائي العام \n⇜ ([ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]) \n⇜ مع العلم يمديك تضيف 999 ردود متعدده بس  \n༄  ")
end
end



if  msg.SudoUser and msg.text and redis:get(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(max..':ReplayRandom:'..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'*⇜* هذا الرد مو مضاف في قائمة الردود العشوائيه ')
end
redis:del(max..':caption_replay:Random:'..msg.text) 
redis:srem(max..':KlmatRRandom:',msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'*⇜* ابشر حذفت الرد \n')
end
--=============================================================================================================================
if not Replay and not redis:get(max..'replayall'..msg.chat_id_) then




local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"-› ما اقدر اقول اكثر من 500 حرف ")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
if callback_Text and callback_Text == 'الاسم سبام' then
return sendMsg(msg.chat_id_,msg.id_,"-› للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif msg.SudoUser and Text=="هاي" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif not msg.SudoUser and Text=="هاي" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif not msg.SudoUser and Text== "اخباركم" or Text== "اخبارك" or Text== "شلونكم" or Text== "كيفكم" or Text== "شلونك" then
return sendMsg(msg.chat_id_,msg.id_,sss[math.random(#sss)])
elseif not msg.SudoUser and Text==" باي" or Text == "باي" then
return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
elseif not msg.SudoUser and Text==" " or Text == "" then
return sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)])
elseif msg.SudoUser and Text== "احبك" then 
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.SudoUser and Text== "تحبني" or Text=="تحبني" then 
return sendMsg(msg.chat_id_,msg.id_," لا أحب سامي ")
elseif not msg.SudoUser and Text== "احبك" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUser and Text== "تحبdkwmkdيومثني" then
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif Text== "غني" or Text=="غنيلي" then 
return sendMsg(msg.chat_id_,msg.id_,song[math.random(#song)])
elseif Text== "شرايك بهذا" or Text== "وش رايك بهذا" or Text== "شنو رايك بهذا" then 
return sendMsg(msg.chat_id_,msg.id_,he[math.random(#he)])
elseif Text== "رايكم" or Text=="شرايك" or Text== "تقيمك" then 
return sendMsg(msg.chat_id_,msg.id_,she[math.random(#she)])
elseif Text==" " or Text==" " then
if msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,' ')
else 
return sendMsg(msg.chat_id_,msg.id_," ") 
end
elseif Text== "رفع زق"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم رفع العضو زق القروب بنجاح\n• تمت إضافته إلى قائمه الزق️")
elseif Text== "تنزيل زق"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم تنزيل العضو من الزق القروب\n• تمت الزاله من قامة الزق️")
elseif Text== "رفع كلب"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم رفع المتهم إلى كلب بنجاح\n• تمت إضافته إلى قائمه الكلاب️")
elseif Text== "رفع حمار"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم رفع المتهم إلى حمار بنجاح\n• تمت إضافته إلى قائمه الحمير")
elseif Text== "تنزيل حمار"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم تنزيل المتهم حمار بنجاح\n• تمت ازالته من قائمه الحمير")
elseif Text== "تنزيل كلب"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي \n• تم تنزيل المتهم كلب بنجاح\n• تمت إزالته من قائمه الكلاب️")
elseif Text== "تنزيل زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم تنزيل المتهم زاحف بنجاح\n• تمت ازالته من قائمه الزواحف️")
elseif Text== "رفع ماعز"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم رفع المتهم ماعز بنجاح\n• الان اصبح ماعز القروب ️")
elseif Text== "تنزيل ماعز"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم تنزيل المتهم ماعز بنجاح\n• تمت ٳزالته من قائمة المواعز️")
elseif Text== "رفع لقلبي"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم رفع العضو داخل قلبك\n• تمت ترقيته بنجاح ️")
elseif Text== "تنزيل من قلبي"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم تنزيل من داخل قلبك\n• تمت ازالته من قائمه القلوب️")
elseif Text== "رفع تاج"  then return sendMsg(msg.chat_id_,msg.id_,"• اهـلا عزيزي\n• تم رفع صديقك تـاج بنجاح \n• اصبح خط احمر ️")
elseif Text== "تنزيل تاج"  then return sendMsg(msg.chat_id_,msg.id_,"• اهـلا عزيزي\n• تم تنزيل العضو المهتلف\n• من قائمة ألتـاج بنجاح ")
elseif Text== "رفع زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم رفع العضو زوجتك بنجاح\n•الان يمكنكم أخذ راحتكم️")
elseif Text== "تنزيل زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم تنزيل الجكمه زوجتك بنجاح\n•الان انتم مفترقان️")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم زواجكم الاثنين بنجاح\n• الان يمكنكم أخذ راحتكم️")
elseif Text== "طلاق"  then return sendMsg(msg.chat_id_,msg.id_,"• اهــلا عزيزي\n• تم طلاق العضو بنجاح\n• الان هو مطلق امشي طلعبرا ")
elseif Text== "اوامر التسليه"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏ـــــــــــــــــــــــــــــــــــــــــــــــ\n• مرحبا عزيزي\n• إليـك اوامر التحشيش كـ التالي\nـــــــــــــــــــــــــــــــــــــــــــــــ\n• رفع «» تنزيل ❬ تـــاج ❭\n• رفع «» تنزيل ❬ زوجتي ❭\n• رفع «» تنزيل ❬ زق ❭\n• رفع «» تنزيل ❬ كلب ❭\n• رفع «» تنزيل ❬ حمار ❭\n• رفع «» تنزيل ❬ خروف ❭\n• رفع «» تنزيل ❬ زاحف ❭\n• رفع «» ❬ لقلبي ❭ تنزيل «» ❬ من قلبي❭\n• ❬ طلاق ❭ «» ❬ زواج ❭\nـــــــــــــــــــــــــــــــــــــــــــــــ")

elseif Text== " " then 
return sendMsg(msg.chat_id_,msg.id_," ")
elseif Text== "ايديي" or Text=="ايدي 🆔" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"• اضغط على الايدي عشان تنسخه\n\n "..USERNAME.." -› ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="ابي رابط الحذف" or Text=="اريد رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
*•* رابط حذف حـساب التلقرام ↯ 
• [اضغط هنا عشان تحذف حسابك](https://telegram.org/deactivate)
• الله يستر عليك يعيني وانتبهلك. 💓

 ]] )
--=====================================
elseif Text== " " or Text== " " or Text==" " then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_," ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_," ")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_," ")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_," ")
else 
return sendMsg(msg.chat_id_,msg.id_," ")
end 
end 




end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:get('kar') then
redis:setex('kar',86400,true) 
json_data = '{"BotID": '..max..',"UserBot": "'..Bot_User..'","Groups" : {'
local All_Groups_ID = redis:smembers(max..'group:ids')
for key,GroupS in pairs(All_Groups_ID) do
local NameGroup = (redis:get(max..'group:name'..GroupS) or '')
NameGroup = NameGroup:gsub('"','')
NameGroup = NameGroup:gsub([[\]],'')
if key == 1 then
json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
else
json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
end
local admins = redis:smembers(max..'admins:'..GroupS)
if #admins ~= 0 then
json_data =  json_data..',"Admins" : {'
for key,value in pairs(admins) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end

local creators = redis:smembers(max..':MONSHA_BOT:'..GroupS)
if #creators ~= 0 then
json_data =  json_data..',"Creator" : {'
for key,value in pairs(creators) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end
local creator = redis:smembers(max..':KARA_BOT:'..GroupS)
if #creator ~= 0 then
json_data =  json_data..',"Kara" : {'
for key,value in pairs(creator) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end

local owner = redis:smembers(max..'owners:'..GroupS)
if #owner ~= 0 then
json_data =  json_data..',"Owner" : {'
for key,value in pairs(owner) do
local info = redis:hgetall(max..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end
json_data =  json_data.."}"
end
local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
Save_Data:write(json_data..'}}')
Save_Data:close()
sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","-› ملف نسخه تلقائيه\n-  اليك مجموعاتك » { "..#All_Groups_ID.." }\n- للبوت » "..Bot_User.."\n- التاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
end
if redis:get(max..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'• انتهى الاشتراك في احد المجموعات \n• المجموعه : '..FlterName(redis:get(max..'group:name'..msg.chat_id_))..'\n• ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'• نتهى الاشتراك البوت \n• سوف اغادر المجموعه فرصه سعيده \n• ╽او راسل المطور للتجديد '..SUDO_USER..' ')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(max..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'🕵🏼️‍♀️╿باقي يوم واحد وينتهي الاشتراك ✋🏿\n👨🏾‍🔧╽راسل المطور للتجديد '..SUDO_USER..'\n📛')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 


return {
max = {
"^(تقييد)$",
"^(تقييد) (%d+)$",
"^(تقييد) (@[%a%d_]+)$",
"^(الغاء التقييد)$",
"^(الغاء التقييد) (%d+)$",
"^(الغاء التقييد) (@[%a%d_]+)$",
"^(فك التقييد)$",
"^(فك التقييد) (%d+)$",
"^(فك التقييد) (@[%a%d_]+)$",
"^(وضع شرط التفعيل) (%d+)$",
"^(التفاعل)$",
"^(التفاعل) (@[%a%d_]+)$",
"^([iI][dD])$",
"^(تفعيل الايدي بالصوره)$",
"^(تعطيل الايدي بالصوره)$",
"^(تعطيل الرفع)$",
"^(تفعيل الرفع)$",
"^(قفل الدخول بالرابط)$",
"^(فتح الدخول بالرابط)$", 
"^(ايدي)$",
"^(ايدي) (@[%a%d_]+)$",
"^(الايدي)$",
"^(الايدي) (@[%a%d_]+)$",
"^(كشف)$",
"^(كشف) (%d+)$",
"^(كشف) (@[%a%d_]+)$",
'^(رفع مميز)$',
'^(رفع مميز) (@[%a%d_]+)$',
'^(رفع مميز) (%d+)$',
'^(تنزيل مميز)$',
'^(تنزيل مميز) (@[%a%d_]+)$',
'^(تنزيل مميز) (%d+)$',
'^(رفع ادمن)$',
'^(رفع ادمن) (@[%a%d_]+)$',
'^(رفع ادمن) (%d+)$',
'^(تنزيل ادمن)$',
'^(تنزيل ادمن) (@[%a%d_]+)$',
'^(تنزيل ادمن) (%d+)$', 
'^(رفع مطي)$',
'^(تنزيل مطي)$', 
"^(@all)$",
"^(ضع كليشه السورس)$",
"^(مسح كليشه السورس)$",
'^(رفع زاحف)$',
'^(تنزيل زاحف)$', 
'^(رفع المدير)$',
'^(رفع مدير)$', 
'^(رفع مدير) (@[%a%d_]+)$',
'^(رفع المدير) (@[%a%d_]+)$',
'^(رفع المدير) (%d+)$',
'^(رفع مدير) (%d+)$',
'^(رفع مالك اساسي)$',
'^(رفع منشئ اساسي)$',
'^(رفع منشئ اساسي) (@[%a%d_]+)$',
'^(رفع مالك اساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي)$',
'^(تنزيل مالك اساسي)$',
'^(تنزيل منشئ اساسي) (%d+)$',
'^(تنزيل مالك اساسي) (%d+)$',
'^(تنزيل مالك اساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
'^(رفع مالك)$',
'^(رفع منشئ)$',
'^(رفع منشئ) (@[%a%d_]+)$',
'^(رفع مالك) (@[%a%d_]+)$',
'^(تنزيل منشئ)$',
'^(تنزيل مالك)$',
'^(تنزيل منشئ) (%d+)$',
'^(تنزيل مالك) (%d+)$',
'^(تنزيل مالك) (@[%a%d_]+)$',
'^(تنزيل منشئ) (@[%a%d_]+)$',
'^(تنزيل المدير)$',
'^(تنزيل مدير)$',
'^(تنزيل مدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (%d+)$',
'^(تنزيل مدير) (%d+)$',
 '^(تعديلاتي)$',
 '^(صلاحياته)$',
 '^(صلاحياتي)$',
'^(صلاحياته) (@[%a%d_]+)$',
'^(قفل) (.+)$',
'^(فتح) (.+)$',
'^(تفعيل)$',
'^(تفعيل) (.+)$',
'^(تعطيل)$',
'^(تعطيل) (.+)$',
'^(وضع تكرار) (%d+)$',
"^(مسح)$",
"^(مسح) (.+)$",
'^(منع) (.+)$',
'^(الغاء منع) (.+)$',
"^(حظر عام)$",
"^(حظر عام) (@[%a%d_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام)$",
"^(الغاء العام) (@[%a%d_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء عام)$",
"^(الغاء عام) (@[%a%d_]+)$",
"^(الغاء عام) (%d+)$",
"^(حظر)$",
"^(حظر) (@[%a%d_]+)$",
"^(حظر) (%d+)$",
"^(الغاء الحظر)$", 
"^(الغاء الحظر) (@[%a%d_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء حظر)$", 
"^(الغاء حظر) (@[%a%d_]+)$",
"^(الغاء حظر) (%d+)$",
"^(طرد)$",
"^(طرد) (@[%a%d_]+)$",
"^(طرد) (%d+)$",
"^(كتم)$",
"^(كتم) (@[%a%d_]+)$",
"^(كتم) (%d+)$",
"^(الغاء الكتم)$",
"^(الغاء الكتم) (@[%a%d_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء كتم)$",
"^(الغاء كتم) (@[%a%d_]+)$",
"^(الغاء كتم) (%d+)$",
"^(رفع مطور)$",
"^(رفع مطور) (@[%a%d_]+)$",
"^(رفع مطور) (%d+)$",
"^(تنزيل مطور)$",
"^(تنزيل مطور) (%d+)$",
"^(تنزيل مطور) (@[%a%d_]+)$",
"^(تعطيل) (-%d+)$",
"^(الاشتراك) ([123])$",
"^(الاشتراك)$",
"^(تنزيل الكل)$",
'^(تنزيل الكل) (@[%a%d_]+)$',
'^(تنزيل الكل) (%d+)$',
"^(شحن) (%d+)$",
"^(المجموعه)$",
"^(كشف البوت)$",
"^(انشاء رابط)$",
"^(وضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(رابط)$",
"^(الرابط)$",
"^(وضع رابط)$",
"^(رابط خاص)$",
"^(الرابط خاص)$",
"^(القوانين)$",
"^(وضع القوانين)$",
"^(وضع قوانين)$",
"^(وضع تكرار)$",
"^(وضع التكرار)$",
"^(الادمنيه)$",
"^(منشن للكل)$",
"^(منشن للمشرفين)$",
"^(منشن)$",
"^(قائمة المنع)$",
"^(المدراء)$",
"^(المميزين)$",
"^(المكتومين)$",
"^(وضع الترحيب)$",
"^(وضع ترحيب)$",
"^(الترحيب)$",
"^(المالك الاساسي)$",
"^(المالكين)$",
"^(المنشئ الاساسي)$",
"^(المالك)$",
"^(المحظورين)$",
"^(وضع صوره)$",
  "^(ضع صوره)$",
"^(طرد البوتات)$",
"^(كشف البوتات)$",
"^(طرد المحذوفين)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(احصائياتي)$",
"^(معلوماتي)$",
"^(مسح معلوماتي)$",
"^(موقعي)$",
"^(رفع الادمنيه)$",
"^(صوره الترحيب)$",
"^(ضع كليشه المطور)$",
"^(المطور)$",
"^(شرط التفعيل)$",
"^(قائمة المجموعات)$",
"^(المجموعات)$",
"^(المجموعات 🌋)$",
"^(المشتركين)$",
"^(المشتركين Ⓜ)$",
"^(اذاعه)$",
"^(تعطيل الافلام)$",
"^(تفعيل الافلام)$",
"^(فلم) (.+)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$",
"^(اذاعه عام بالتوجيه ??)$", 
"^(اذاعه خاص 🗣)$", 
"^(اذاعه عام 📢)$", 
"^(اذاعه 🗣)$", 
"^(قائمة العام)$",
"^(قائمه العام 📜)$",
"^(المطورين)$",
"^(المطورين 🔥)$",
"^(تيست)$",
"^(test)$",
"^(ايديي🆔)$",
"^(قناة السورس 📡)$",
"^(الاحصائيات)$",
"^(الاحصائيات 💥)$",
"^(اضف رد عام)$",
"^(اضف رد عام ➕)$",
"^(مسح الردود)$",
"^(مسح ردود المطور)$",
"^(ضع اسم للبوت)$",
"^(مسح الصوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(ردود المطور)$",
"^(الردود العامه 🗨)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس 🔂)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(تنظيف المجموعات 🗑)$",
"^(تنظيف المشتركين 🗑)$",
"^(رتبتي)$",
"^(ضع اسم للبوت ©)$",
"^(ضع صوره للترحيب 🌄)$",
"^(وضع صوره للترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر ✖️)$",
"^(الرتبه)$",
"^(الغاء)$",
"^(نقاطي)$",
"^(اسمي)$",
"^(التاريخ)$",
"^(/[Ss]tore)$",
"^(اصدار السورس)$",
"^(الاصدار)$",
"^(server)$",
"^(السيرفر)$",
"^(فحص البوت)$", 
"^(نسخه احتياطيه للمجموعات)$",
"^(رفع نسخه الاحتياطيه)$", 
"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(تفعيل الاشتراك الاجباري ☑)$", 
"^(تعطيل الاشتراك الاجباري ♻️)$", 
"^(تغيير الاشتراك الاجباري 🔁)$", 
"^(الاشتراك الاجباري ⚠️)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 









"^(السورس)$",
"^(المالك)$",
"^(سورس)$",
"^(م المطور)$", 
"^(اوامر الرد)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(م4)$",
"^(التسليه)$",
"^(اليوتيوب)$",
"^(الساوند)$",
"^(م7)$",
"^(م١)$",
"^(م٢)$",
"^(م٣)$",
"^(م٤)$",
"^(م٥)$",
"^(التسلية)$",
"^(يوتيوب)$", 
"^(ساوند)$", 
"^(اضف رد عشوائي عام)$", 
"^(مسح رد عشوائي عام)$", 
"^(الردود العشوائيه العامه)$", 
"^(مسح الردود العشوائيه العامه)$", 
"^(تعطيل الردود العشوائيه)$",
"^(تعطيل الردود العشوائية)$",
"^(تفعيل الردود العشوائيه)$",
"^(تفعيل الردود العشوائية)$",
 },
 imax = imax,
 dmax = dmax,
 }
