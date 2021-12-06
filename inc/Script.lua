

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

Bot_Api = 'https://api.telegram.org/bot' ..Token
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
return "*•* هذا الامر يخص {المدير,المالك,MR} فقط "
end
redis:set(max.."getidstatus"..msg.chat_id_, "Simple")
return  "*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم تعطيل الايدي بالصوره \n" 
end 
function unlock_photos(msg)
if not msg.Director then
return "*•* هذا الامر يخص {المدير,المالك,MR} فقط "
end
redis:set(max.."getidstatus"..msg.chat_id_, "Photo")
return  "*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم تفعيل الايدي بالصوره \n" 
end
function cmds_on(msg)
if not msg.Creator then return "*•* هذا الامر يخص {المالك,MR} فقط  "
end
redis:set(max..'lock:kara:'..msg.chat_id_,'on')
return "*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم تعطيل الرفع في المجموعه \n "
end
function cmds_off(msg)
if not msg.Creator then return "*•* هذا الامر يخص {المالك,MR} فقط "
end
redis:set(max..'lock:kara:'..msg.chat_id_,'off')
return "*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم تفعيل الرفع في المجموعه \n"
end

function lockjoin(msg)
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  "
end
redis:set(max..'lock:join:'..msg.chat_id_,true)
return "*• أهلا عزيزي *"..msg.TheRankCmd.."*\n*•* تم قفل الدخول بالرابط \n *" 

end
function unlockjoin(msg)
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  "
end
redis:del(max..'lock:join:'..msg.chat_id_)
return "*•* أهلا عزيزي *"..msg.TheRankCmd.."*\n*•* تم فتح الدخول بالرابط  \n" 
end


local function imax(msg,MsgText)

if msg.forward_info_ then return false end

Channel = redis:get(max..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(max..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUmath then
function name(arg,data)
bd = '• اسمك  ('..(data.first_name_ or '')..')\n• معرفك (@'..(data.username_ or '')..')\n\n• اشترك بالقناة اول \n• بعدها ارجع .'
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
redis:set(max.."lock_RandomRdod"..msg.chat_id_,true)
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
if not msg.SudoUmath then return "• هذا الامر يخص {MR} فقط " end
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
if not msg.SudoUmath then return "• هذا الامر يخص {MR} فقط " end
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
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end
local check_time = redis:ttl(max..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*• مـفـتـوح *' end
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
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(max..'group:name'..msg.chat_id_) or '')
redis:set(max..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"• معلومات المجموعه \n\n"
.."*•* عدد الاعضاء : "..data.member_count_.." "
.."\n*•* عدد المحظورين : "..data.kicked_count_.." "
.."\n*•* عدد الادمنيه : "..data.administrator_count_.." "
.."\n*•* ايدي المجموعه : "..msg.chat_id_.." "
.."\n\n• الاسم : ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")\n"
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
if not msg.Admin then return "️*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمة المنع" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط" end
return settingsall(msg) 
end

if MsgText[1] == "المالك" then
local creator = redis:get(max..':mon:'..msg.chat_id_) or 12566691410
GetUserID(creator,function (arg,data)
sendMsg(msg.chat_id_,msg.id_,"["..data.first_name_.."](t.me/"..data.username_..")")
end)
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return GetListAdmin(msg) 
end

if MsgText[1] == "منشن" or MsgText[1] == "منشن الكل" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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


if MsgText[1] == "منشن المشرفين" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100  },function(ta,moody)
x = 0
list = moody.members_
for k, v in pairs(list) do
GetUserID(v.user_id_,function(arg,data)
x = x + 1
if x == 1 then
t = "• قائمة المشرفين \n\n"
end
if data.username_ then
t = t..""..x.."-  [@"..data.username_.."]  \n"
end
if k == 0 then
send_msg(msg.chat_id_,t,msg.id_)
end
end)
end
end,nil)
end


if MsgText[1] == "كشف المجموعه" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg).. malken(msg)
end

if msg.text and msg.text:match('@all (.*)')  then
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المالك,MR} فقط \n" end 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa)   
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,datate)  
x = 0  
tags = 0  
local list = datate.members_   
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 10 or x == tags or k == 0 then
tags = x + 10
t = ""
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 10 or x == tags or k == 0 then
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(msg.text:match('@all (.*)')..'\n'..t).."&parse_mode=Markdown&reply_to_message_id="..msg_id)
end  
end,nil)  
end  
end,nil)  
end,nil)  
end
if MsgText[1] == "@all" then  
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المالك,MR} فقط \n" end 
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return ownerlist(msg) 
end

if MsgText[1] == "المالكين" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return malken(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط " end
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
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط " end
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
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط" end
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
return sendMsg(msg.chat_id_,msg.id_,'\n• أهلا عزيزي البوت مشرف المجموعه \n• صلاحياته هي  \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n• تغير معلومات المجموعه : '..info..'\n• حذف الرسائل : '..delete..'\n• حظر المستخدمين : '..restrict..'\n• دعوة مستخدمين :  '..invite..' \n• تثبيت الرسائل : '..pin..'\n• اضافة مشرفين جدد - '..promote..'\n\n• ملاحظة » علامة ❪  ꪜ ❫ يعني عنده الصلاحية وعلامة ❪ ✘ ❫ يعني ماعنده الا الضعوي')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if redis:get(max..'lock_pin'..msg.chat_id_) then
return "• لا يمكنك التثبيت الامر معطل من الاداره"end
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "• لا يمكنك التثبيت الامر معطل من الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(max..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.." \n*•*  تم تثبيت الرساله \n")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* عذراً لا يمكنني التثبيت \n*•* ليس لدي صلاحية التثبيت \n')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
if not msg.Director and redis:get(max..'lock_pin'..msg.chat_id_) then
return "• لا يمكنك الغاء التثبيت الامر معطل من الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."  \n*•* تم الغاء التثبيت  \n")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* عذراً لا يمكنني الغاء التثبيت .\n*•* ليس لدي صلاحية التثبيت \n')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'*•* عذراً '..msg.TheRankCmd..' .\n*•* لايوجد رساله مثبته \n')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط" end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•*  الرفع معطل\n")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
if not msg.Creator then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
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
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* الرفع معطل ")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
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
if not msg.SudoUser then return "*•* هذا الامر يخص {MR} فقط  " end
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
if not msg.SudoUser then return "*•* هذا الامر يخص {MR} فقط  " end
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
if not msg.Kara then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
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
if not msg.Kara then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
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
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
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
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* الرفع معطل \n")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end

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
return "• أهلا عزيزي "..msg.TheRankCmd.." \n• تم تنزيل : "..numKARA_BOT.." من المالكين الاساسيين\n• تم تنزيل : "..numMONSHA.." من المالكين \n• تم تنزيل : "..numowners.." من المدراء\n• تم تنزيل : "..numadmins.." من الادمنيه\n• تم تنزيل : "..numwhitelist.." من المميزين\n\n- " 
elseif msg.SudoUmath then 
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
return "• أهلا عزيزي "..msg.TheRankCmd.." \n• تم تنزيل : "..numKARA_BOT.." من المالكين الاساسي\n• تم تنزيل : "..numMONSHA.." من المالكين\n• تم تنزيل : "..numowners.." من المدراء\n• تم تنزيل : "..numadmins.." من الادمنيه\n• تم تنزيل : "..numwhitelist.." من المميزين\n\n- " 
elseif msg.Kara then 
numMONSHA = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
numowners = redis:scard(max..'owners:'..msg.chat_id_)
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• أهلا عزيزي "..msg.TheRankCmd.." \n• تم تنزيل : "..numMONSHA.." من المالكين \n• تم تنزيل : "..numowners.." من المدراء\n• تم تنزيل : "..numadmins.." من الادمنيه\n• تم تنزيل : "..numwhitelist.." من المميزين\n\n-" 
elseif msg.Creator then 
numowners = redis:scard(max..'owners:'..msg.chat_id_)
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'owners:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• أهلا عزيزي "..msg.TheRankCmd.." \n• تم تنزيل : "..numowners.." من المدراء\n• تم تنزيل : "..numadmins.." من الادمنيه\n• تم تنزيل : "..numwhitelist.." من المميزين\n\n-" 
elseif msg.Director then 
numadmins = redis:scard(max..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'admins:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• أهلا عزيزي "..msg.TheRankCmd.." \n• تم تنزيل : "..numadmins.." من الادمنيه\n• تم تنزيل : "..numwhitelist.." من المميزين\n\n-" 
elseif msg.Admin then 
numwhitelist = redis:scard(max..'whitelist:'..msg.chat_id_)
redis:del(max..'whitelist:'..msg.chat_id_)
return "• أهلا عزيزي "..msg.TheRankCmd.." \n• تم تنزيل : "..numwhitelist.." من المميزين\n\n-" 
end
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(msg.chat_id_,msg.id_,"*•* المستخدم هذا ليس موجود بالمجموعات \n") end
local UserID = data.sender_user_id_
msg = arg.msg
msg.UserID = UserID
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
msg = arg.msg
UserID = msg.UserID
if UserID == our_id then return sendMsg(msg.chat_id_,msg.id_,"*•* لا يمكنك تنفيذ الامر مع البوت\n") end

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
local DonisDown = "\n• تم التنزيل من الرتب التاليه : \n\n "
if redis:sismember(max..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."MR\n"
end 
if redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك الاساسي\n"
end 
if redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك\n"
end 
if redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المدير\n"
end 
if redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."الادمن\n"
end 
if redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."مميز\n"
end
function senddwon() sendMsg(msg.chat_id_,msg.id_,"*•* رتبته اعلى منك لا يمكنك تنزيله \n") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"*•* لا يمكنك تنزيله رتبته مثل رتبتك : "..msg.TheRankCmd.." \n") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"• المستخدم   "..NameUser.."  \nعضو مسبقاً \n")  end
huk = false
if msg.SudoBase then 
redis:srem(max..':SUDO_BOT:',UserID)
redis:srem(max..':KARA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(max..'owners:'..msg.chat_id_,UserID)
redis:srem(max..'admins:'..msg.chat_id_,UserID)
redis:srem(max..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUmath then 
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

if not huk then sendMsg(msg.chat_id_,msg.id_,"• المستخدم : "..NameUser.."\n"..DonisDown.."\n") end

end,{msg=msg})
end,{msg=msg})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* لايوجد عضو بهذا المعرف \n") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* لا يمكنك تنفيذ هذا الامر مع البوت\n") end

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
local DonisDown = "\n• تم التنزيل الرتب التاليه : \n\n "
if redis:sismember(max..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."MR\n"
end 
if redis:sismember(max..':KARA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك الاساسي\n"
end 
if redis:sismember(max..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك\n"
end 
if redis:sismember(max..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المدير\n"
end 
if redis:sismember(max..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."الادمن\n"
end 
if redis:sismember(max..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.." مميز\n"
end

function senddwon() sendMsg(msg.chat_id_,msg.id_,"*•* رتبته اعلى منك لا يمكنك تنزيله \n") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"*•* لا يمكنك تنزيله رتبته مثل رتبتك : "..msg.TheRankCmd.." \n") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"• المستخدم : "..NameUser.."\nعضو مسبقاً \n")  end
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

if not huk then sendMsg(msg.chat_id_,msg.id_,"• المستخدم : "..NameUser.." \n"..DonisDown.."\n") end

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
if MsgText[1] == "فتح ردود MR" 		then return unlock_reda(msg) end 
if MsgText[1] == "فتح حظر العام" 		then return unlock_blo(msg) end
if MsgText[1] == "فتح الاحصائيات" 		then return unlock_has(msg)(msg) end
if MsgText[1] == "قفل ردود MR" 		then return lock_reda(msg) end
if MsgText[1] == "قفل حظر العام" 		then return lock_blo(msg) end
if MsgText[1] == "قفل الاحصائيات" 		then return lock_has(msg) end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
if not redis:get(max..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(max..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(max..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"*•* تم انشاء رابط جديد \n• "..LinkGp.."\n•  لرؤية الرابط ارسل : الرابط \n")
else
return sendMsg(msg.chat_id_,msg.id_,"• لا يمكنني انشاء رابط للمجموعه .\n• ليس لدي الصلاحيه ")
end
else
return sendMsg(msg.chat_id_,msg.id_,"• لقد قمت بإنشاء الرابط سابقاً\n• ارسل { الرابط } لرؤية الرابط \n  ")
end
return false
end 
if MsgText[1] == "تعطيل الافلام" then 
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
sendMsg(msg.chat_id_, msg.id_, '• تم تعطيل الافلام') 
redis:set(max.."BLACKBOTSS:movie_bot"..msg.chat_id_,"close") 
end 
if MsgText[1] == "تفعيل الافلام" then 
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
sendMsg(msg.chat_id_, msg.id_,'• تم تفعيل الافلام') 
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

if MsgText[1] == "ضع رابط" then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
redis:setex(max..'linkGroup'..msg.sender_user_id_,300,true)
return '• ارسل الرابط الجديد '
end

if (MsgText[1] == "الرابط") then
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "• لا يوجد رابط .\n• لانشاء رابط ارسل `انشاء رابط`\n" 
end
local GroupName = redis:get(max..'group:name'..msg.chat_id_)
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
local LinkG = "["..GroupName.."]("..GroupLink..")"
return 
sendMsgg(msg.chat_id_,msg.id_,LinkG)
end
  
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط " end
local GroupLink = redis:get(max..'linkGroup'..msg.chat_id_)
if not GroupLink then return "*•* عذراً ، لايوجد رابط\n• *اكتب [ضع رابط]*" end
local Text = "• رابط المجموعة \n "..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "*•* عذراً \n• لا يمكنني ارسال الرابط لانك قمت بحظر البوت\n"
elseif res == 400 then
return "*•* عذراً \n• لا يمكنني ارسال الرابط قم بمراسلة البوت اولاً \n"
end
if res == 200 then 
return "*•* أهلا عزيزي "..msg.TheRankCmd.."  \n• تم ارسال لك الرابط خاص \n"
end
end


if MsgText[1]== 'ضع قوانين' or MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
redis:setex(max..'rulse:witting'..msg.sender_user_id_,300,true)
return '• تم\n•  ارسل القوانين التي تريدها للمجموعة \n'
end

if MsgText[1] == "القوانين" then
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "*•* القوانين كالتالي : \n• ممنوع نشر الروابط \n• ممنوع التكلم او نشر صور اباحيه \n• ممنوع  اعاده توجيه\n• ممنوع التكلم بالطائفه \n• الرجاء احترام المدراء والادمنيه\n"
else 
return "*• القوانين :*\n"..redis:get(max..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "*•* حدود التكرار ,  يجب ان تكون بين  *[2-50]*" 
end
redis:set(max..'flood'..msg.chat_id_,MsgText[2]) 
return "*•* تم ضع التكرار : "..MsgText[2].." "
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
if 500 < tonumber(MsgText[2]) then return "*•* حدود المسح , يجب ان تكون بين *[2-100]*" end
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
sendMsg(msg.chat_id_,msg.id_,"*•* تم مسح : "..MsgText[2].." من الرسائل \n")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*•* تم مسح : "..MsgText[2].." من الرسائل \n ")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end

local Admins = redis:scard(max..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "*•* لايوجد ادمنيه \n" 
end
redis:del(max..'admins:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح : "..Admins.." من الادمنيه\n "
end


if MsgText[2] == "قائمة المنع" then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
local Mn3Word = redis:scard(max..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "*•* عذراً لايوجد كلمات ممنوعه ليتم مسحها \n" 
end
redis:del(max..':Filter_Word:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح : "..Mn3Word.." كلمة من المنع \n"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
if not redis:get(max..'rulse:msg'..msg.chat_id_) then 
return "• عذراً لايوجد قوانين ليتم امسحها \n" 
end
redis:del(max..'rulse:msg'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح القوانين \n"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
if not redis:get(max..'welcome:msg'..msg.chat_id_) then 
return "*•* عذراً ،\n• لايوجد ترحيب ليتم مسحه \n" 
end
redis:del(max..'welcome:msg'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح الترحيب \n"
end


if MsgText[2] == "المالك الاساسي" then
if not msg.SudoUser then return "*•* هذا الامر يخص {MR} فقط " end
local NumMnsha = redis:scard(max..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "• لايوجد مالك اساسي \n" 
end
redis:del(max..':Hussain:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."\n• تم مسح : "..NumMnsha.." المالك الاساسي \n"
end


if MsgText[2] == "المالكين" then
if not msg.SudoUser then return "*•* هذا الامر يخص {MR} فقط  " end
local NumMnsha = redis:scard(max..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "• عذراً لايوجد مالكيين ليتم مسحهم\n" 
end
redis:del(max..':MONSHA_BOT:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح  "..NumMnsha.." : من المالكين\n"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
local NumMDER = redis:scard(max..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "• عذراً لايوجد مدراء ليتم مسحهم \n" 
end
redis:del(max..'owners:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n•  تم مسح : "..NumMDER.." من المدراء \n"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end

local list = redis:smembers(max..'banned:'..msg.chat_id_)
if #list == 0 then return "*• لايوجد اعضاء محظورين  *" end
message = '*•* قائمة الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(max..'banned:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.." \n• تم مسح : "..#list.." من المحظورين \n"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
local MKTOMEN = redis:scard(max..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "*•*  لايوجد اعضاء مكتومين " 
end
redis:del(max..'is_silent_users:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح : "..MKTOMEN.." من المكتومين \n"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
local MMEZEN = redis:scard(max..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*•* لايوجد اعضاء مميزين " 
end
redis:del(max..'whitelist:'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح : "..MMEZEN.." من المميزين \n"
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
if not redis:get(max..'linkGroup'..msg.chat_id_) then 
return "*•* لايوجد رابط مضاف " 
end
redis:del(max..'linkGroup'..msg.chat_id_)
return "*•* أهلا عزيزي "..msg.TheRankCmd.."   \n• تم مسح  رابط المجموعه \n"
end


end 
--End del 



if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "*•*هذا الامر يخص {المالك,MR} فقط \n" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم مسح الصوره المجموعه \n')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "*•*هذا الامر يخص {المالك,MR} فقط \n" end
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
return sendMsg(msg.chat_id_,msg.id_,'• ليس لدي صلاحيه تغيير معلومات\n')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(max..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '• حسناً عزيزي\n• الآن قم بأرسال الصوره\n' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "*•*هذا الامر يخص {المالك,MR} فقط\n" end
redis:setex(max..'about:witting'..msg.sender_user_id_,300,true) 
return "• حسناً عزيزي\n• الآن قم بأرسل وصف المجموعه\n" 
end
if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "•*هذا الامر يخص {MR,المالك} فقط  \n" end
redis:setex(max..'name:witting'..msg.sender_user_id_,300,true)
return "• حسناً عزيزي\n• الان ارسل الاسم المجموعه\n"
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"• لايوجد بوتات في المجموعة") 
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
local TextR  = "• عدد البوتات : "..(Total - 1).."\n\n"
if NumBot == 0 then 
TextR = TextR.."• لا يمكنني طردهم لأنهم مشرفين "
else
if NumBotAdmin >= 1 then
TextR = TextR.."• لم يتم الطرد "..NumBotAdmin.." بوت لأنهم مشرفين \n"
else
TextR = TextR.."• تم طرد كل البوتات  "
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
if not msg.Director then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '• قائمة البوتات الحاليه\n\n'
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

• لديك {]]..total..[[} بوتات
• ملاحظة : الـ ★ تعني ان البوت مشرف في المجموعة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
sendMsg(msg.chat_id_,msg.id_,'• جاري البحث عن الحسابات المحذوفه ... ')
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
sendMsg(msg.chat_id_,msg.id_,"• تم طرد : "..NumMemDone.." من الحسابات المحذوفه‏‏")
else
sendMsg(msg.chat_id_,msg.id_,'• لايوجد حسابات محذوفه في المجموعه')
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
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "لايوجد" end
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
		ali = {'',
		}
		ssssys = ali[math.random(#ali)]
		if not redis:get(max.."KLISH:ID") then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,''..ssssys..' \n• ʏᴏᴜʀ ɪᴅ : '..msg.sender_user_id_..'\n• ᴜѕᴇʀɴᴀᴍᴇ : '..UserNameID..'\n• ѕᴛᴀᴛѕ : '..msg.TheRank..'\n• ᴍѕɢѕ : '..msgs..'\n• ʙɪᴏ : '..bio..'',dl_cb,nil)
		else
		Text = redis:get(max.."KLISH:ID")
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
		if not redis:get(max.."KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'• لا يمكنني عرض صورتك لانك قمت بحظر البوت او انك لاتملك صوره في ملفك الشخصي \n• ʏᴏᴜʀ ɪᴅ : '..msg.sender_user_id_..' \n• ᴜѕᴇʀɴᴀᴍᴇ : '..UserNameID..'\n• ѕᴛᴀᴛѕ : '..msg.TheRank..'\n• ᴍѕɢѕ : '..msgs..'\n • ʙɪᴏ : '..bio..'',dl_cb,nil)
		else
		Text = redis:get(max.."KLISH:ID")
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
	if redis:get(max.."KLISH:ID") then
		Text = redis:get(max.."KLISH:ID")
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
		sendMsg(msg.chat_id_,msg.id_,'الايدي بالصوره معطل \n• ʏᴏᴜʀ ɪᴅ : '..msg.sender_user_id_..' \n• ᴜѕᴇʀɴᴀᴍᴇ : '..UserNameID..'\n• ѕᴛᴀᴛѕ : '..msg.TheRank..'\n• ᴍѕɢѕ : '..msgs..'\n• ʙɪᴏ : '..bio..'',dl_cb,nil)
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

local Get_info =  " \n• احصائيات رسائلك \n \n"
.."• الرسائل : "..msgs.."\n"
.."• الجهات : "..NumGha.."\n"
.."• الصور : "..photo.."\n"
.."• المتحركه : "..animation.."\n"
.."• الملصقات : "..sticker.."\n"
.."• البصمات : "..voice.."\n"
.."• الصوت : "..audio.."\n"
.."• الفيديو : "..video.."\n"
.."• التعديل : "..edited.."\n"
.."• تفاعلك : "..Get_Ttl(msgs).."\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "*•* عذراً ليس لديك رسائل  " end
redis:del(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "*•* تم مسح : "..msgs.." من رسائلك"
end

if MsgText[1]== 'جهاتي' then
return '*•*  عدد جهاتك المضافه : '..(redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' '
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "*•* عذراً ليس لديك جهات ليتم مسحها" end
redis:del(max..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "*•* تم مسح : "..adduser.." من جهاتك"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n• اسمك الثاني : '..(data.last_name_ or ""),90)
local Get_info = "• اسمك الاول :\n "..FlterName.."\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end


if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return "*•* عذراً ليس لديك نقاط ليتم  مسحها" end
redis:del(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "*•* تم مسح : "..points.." من نقاطك"
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

local Get_info ="• أهلا عزيزي هذي معلوماتك\n"
..""
.."• الاسم : "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).."\n"
.."• المعرف : "..ResolveUser(data).."\n"
.."• الايدي : "..msg.sender_user_id_.."\n"
.."• رتبتك : "..msg.TheRank.."\n"
..""..msg.chat_id_.."\n"
..""
.." • الاحصائيات الرسائل\n"
.."• الرسائل : "..msgs.."\n"
.."• الجهات : "..NumGha.."\n"
.."• الصور : "..photo.."\n"
.."• المتحركه : "..animation.."\n"
.."• الملصقات : "..sticker.."\n"
.."• البصمات : "..voice.."\n"
.."• الصوت : "..audio.."\n"
.."• الفيديو : "..video.."\n"
.."• التعديل : "..edited.."\n"
.."• تفاعلك : "..Get_Ttl(msgs).."\n"
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

local Get_info ="• أهلا عزيزي تم مسح معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end
if MsgText[1] == "تفعيل الردود المتعدده" or MsgText[1] == "تفعيل الردود المتعددة" then print ("hi") return unlock_replayRn(msg) end
if MsgText[1] == "تعطيل الردود المتعدده" or MsgText[1] == "تعطيل الردود المتعددة"	then return lock_replayRn(msg) end
if MsgText[1] == "تفعيل" then
if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "ردود MR" 	then return unlock_replayall(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "ردود MR" 	then return lock_replayall(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1]== 'ضع ترحيب' or MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
redis:set(max..'welcom:witting'..msg.sender_user_id_,true) 
return "• تم\n• ارسل كليشه الترحيب \n\n• ملاحظة يمكنك اضافه دوال للترحيب مثلا :\n• اظهار قوانين المجموعه  : *{القوانين}*  \n• اظهار اسم المستخدم : *{الاسم}*\n• اظهار معرف المستخدم : *{المعرف}*\n• اظهار اسم المجموعه : *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "*•* هذا الامر هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
if redis:get(max..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(max..'welcome:msg'..msg.chat_id_))
else 
return "*•* أهلا عزيزي "..msg.TheRankCmd.."  \n• أنرت  " 
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} بس " end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'قائمة M'  then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط " end
local mtwren = redis:scard(max..':SUDO_BOT:')
if mtwren == 0 then  return "*•* عذراً لايوجد مطورين " end
redis:del(max..':SUDO_BOT:') 
return "*•* تم مسح : "..mtwren.." من قائمة M"
end

if MsgText[1] == 'مسح' and MsgText[2] == 'قائمة MR'  then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط " end
local mtwren = redis:scard(max..':SUDO_BOOOT:')
if mtwren == 0 then  return "*•* عذراً لايوجد مطورين " end
redis:del(max..':SUDO_BOOOT:') 
return "*•* تم مسح : "..mtwren.." من قائمة MR"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمة العام"  then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط  " end
local addbannds = redis:scard(max..'gban_users')
if addbannds ==0 then 
return "*• قائمة الحظر فارغه .*" 
end
redis:del(max..'gban_users') 
return "️*•* تم مسح : "..addbannds.." من قائمة العام" 
end 

if MsgText[1] == "رفع M" then
if not msg.SudoBase then return "*•* هذا الامر يخص {MR} فقط  " end
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

if MsgText[1] == "تنزيل M" then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط  " end
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

if MsgText[1] == "رفع MR" then
if not msg.SudoBase then return "*•* هذا الامر يخص {MR} فقط  " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudoo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudoo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudoo"}) 
return false
end 
end

if MsgText[1] == "تنزيل MR" then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط  " end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudoo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudoo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudoo"}) 
return false
end 
end

if msg.SudoBase then
if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "نظف المجموعات " then
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
sendMsg(msg.chat_id_,msg.id_,'*•* لا توجد مجموعات وهميه ')
else
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المجموعات : '..#groups..'\n*•* تم تنظيف : '..GroupDel..' مجموعة \n*•* اصبح العدد الحقيقي الآن : '..GroupsIsFound..' مجموعة')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" or MsgText[1] == "تنظيف المشتركين" then
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
sendMsg(msg.chat_id_,msg.id_,'• جيد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المشتركين : '..#pv..'\n*•* تم تنظيف : '..NumPvDel..'  مشترك \n*•* اصبح العدد الحقيقي الان : '..SenderOk..' من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صورة الترحيب" or MsgText[1]=="ضع صوره الترحيب" then 
redis:setex(max..'welcom_ph:witting'..msg.sender_user_id_,300,true)  
return'• حسناً ، الآن ارسل الصوره التي تريدها للترحيب\n'  
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
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[• اهلا بك عزيزي انا بوت اسمي]]..redis:get(max..':NameBot:')..[[ 🗽.
• اختصاصي حماية المجموعات .
• من السبام والتوجية والتكرار .
• المطور : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 
]])

return false
else
return "• لا توجد صوره للترحيب في البوت \n• لأضافة صوره الترحيب ارسل `ضع صوره الترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(max..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '• حسناً عزيزي  \n• الآن قم بأرسال الكليشه ' 
end

if MsgText[1] == "ضع كليشه السورس" then 
redis:setex(max..'text_sudo:wittingg'..msg.sender_user_id_,1200,true) 
return '• حسناً عزيزي \n• الان قم بارسال السورس \n' 
end

if MsgText[1] == "مسح كليشه السورس" then 
if not redis:get(max..":TEXT_SUDOD") then
return '• لا يوجد كليشه للسورس\n' end
redis:del(max..':TEXT_SUDOD') 
return '• أهلا عزيزي '..msg.TheRank..'\n• تم مسح كليشه السورس\n' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(max..':addnumberusers',MsgText[2]) 
return '*•* تم وضع شرط تفعيل البوت اذا كانت المجموعه‏‏ اكثر من : '..MsgText[2]..' عضو ' 
end

if MsgText[1] == "شرط التفعيل" then 
return'*•* شرط تفعيل البوت اذا كانت المجموعه‏‏ اكثر من : '..redis:get(max..':addnumberusers')..' عضو ' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات" then
if not msg.SudoUmath then return "*•* هذا الامر يخص {MR} فقط " end
return '*•* عدد المجموعات المفعلة : '..redis:scard(max..'group:ids')..' ' 
end

if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين" then
if not msg.SudoUmath then return "*•* هذا الامر يخص {MR} فقط " end
return '*•* عدد المشتركين في البوت :`'..redis:scard(max..'users')..'` '
end

if MsgText[1] == 'قائمة المجموعات' then 
if not msg.SudoBase then return "*•* هذا الامر يخص {MR} فقط " end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUmath then return "*•* هذا الامر يخص {MR} فقط " end
if redis:sismember(max..'group:ids',MsgText[2]) then
local name_gp = redis:get(max..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'*•* تم تعطيل المجموعه بأمر من MR \n')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '*•* تم تعطيل المجموعه ومغادرتها \n*•* المجموعة : '..name_gp..'\n*•* الايدي : '..MsgText[2]..' '
else 
return '*•* لا توجد مجموعه مفعله بهذا الايدي \n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(max..":TEXT_SUDO") or '• لا توجد كليشه المطور .\n• يمكنك اضافه كليشه من خلال الامر\n " `ضع كليشه المطور` " \n'
end

if MsgText[1] == "مسح كليشه المطور" then 
if not redis:get(max..":TEXT_SUDO") then
return '• لا يوجد كليشه للمطور\n' end
redis:del(max..':TEXT_SUDO') 
return '• أهلا عزيزي '..msg.TheRank..'\n• تم مسح كليشه المطور\n' 
end

if MsgText[1] == "سورس" or MsgText[1]=="السورس" then
Text = redis:get(max..":TEXT_SUDOD") or '• لا يوجد كليشه للسورس\n• يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه السورس` " \n'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '• sᴏᴜʀᴄᴇ ᴘᴇᴛᴇʀ .',url="t.me/VV6YV"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه" then
if not msg.SudoUser then return"*•* هذا الامر يخص {MR} فقط " end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه معطله بواسطة MR" 
end
redis:setex(max..'fwd:'..msg.sender_user_id_,300, true) 
return "• حسناً الآن ارسل التوجيه للاذاعه " 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام" then		
if not msg.SudoUser then return"*•* هذا الامر يخص {MR} فقط   " end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه معطله بواسطة MR" 
end
redis:setex(max..'fwd:all'..msg.sender_user_id_,300, true) 
return "• حسناً الآن ارسل الكليشه للاذاعه عام " 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص " then		
if not msg.SudoUser then return "*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه معطله بواسطة MR" 
end
redis:setex(max..'fwd:pv'..msg.sender_user_id_,300, true) 
return "• حسناً الآن ارسل الكليشه للاذاعه خاص "
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه" then		
if not msg.SudoUser then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_brod') then 
return "*•* الاذاعه معطله بواسطة MR" 
end
redis:setex(max..'fwd:groups'..msg.sender_user_id_,300, true) 
return "• حسناً الآن ارسل الكليشه للاذاعه للمجموعات " 
end

if MsgText[1] == "قائمة MR" then
if not msg.SudoBase then return"*•* هذا الامر يخص {Dev} فقط" end
return sudolMR(msg) 
end

if MsgText[1] == "قائمة M" then
if not msg.SudoBase then return"*•* هذا الامر يخص {Dev} فقط" end
return sudolM(msg) 
end
 
if MsgText[1] == "قائمة العام" or MsgText[1]=="قائمه العام " then 
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط" end
return GetListGeneralBanned(msg) 
end


if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ") then 
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل") then 
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط  " end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_blo') then 
return "• اوامر العام مقفوله من قبل Dev  " end

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
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_blo') then 
return "• اوامر العام مقفوله من قبل Dev  " end
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

if MsgText[1] == "رتبتي" then return '*•* رتبتك : '..msg.TheRank..' ' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر" or MsgText[1] == "الغاء" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
redis:del(max..'welcom:witting'..msg.sender_user_id_,
max..'rulse:witting'..msg.sender_user_id_,
max.."addsot"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu",
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
max..'text_sudo:wittingg'..msg.sender_user_id_,
max..'addrd:'..msg.chat_id_..msg.sender_user_id_,
max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '*•* تم الغاء الامر'
end  


if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '• اصدار سورس بيتر  : *v'..version..'* '
end

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس') then
if not msg.SudoBase then return "*•* هذا الامر يخص {MR} فقط  " end
local GetVerison = https.request('https://github.com/MAXTELLE/max.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'*•* يوجد تحديث جديد الآن \n*•* جاري تنزيل وتثبيت التحديث  ...')
redis:set(max..":VERSION",GetVerison)
return false
else
return "• الاصدار الحالي : *v"..version.."* \n*•* لديك احدث اصدار"
end
return false
end

if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "*•* هذا الامر يخص {MR} فقط  " end
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
sendMsg(msg.chat_id_,msg.id_,'*•* جاري رفع النسخه انتظر قليلا ')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"*•* عذرا النسخه الاحتياطيه هذا ليست للبوت : "..Bot_User.." ")
end
else 
sendMsg(msg.chat_id_,msg.id_,'*•* عذرا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس بيتر يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم ')
end  
else
sendMsg(msg.chat_id_,msg.id_,'*•* عذرا الملف ليس بصيغه Json !? ')
end 
else
sendMsg(msg.chat_id_,msg.id_,'*•* عذرا هذا ليس ملف النسحه الاحتياطيه للمجموعات ')
end 
end,nil)
else 
return "*•* ارسل ملف النسخه الاحتياطيه اولا\n*•* ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط" end
return "• البوت يعمل" 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي") and msg.type == "pv" then return 
'..msg.sender_user_id_..' end

if MsgText[1]== " " and msg.type == "pv" then
local inline = {{{text=" ",url=" "}}}
send_key(msg.sender_user_id_,'  [ ]( )',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات" or MsgText[1]=="الاحصائيات") then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_has') then 
return "• الاحصائيات مقفوله من قبل Dev  " end
return '• الاحصائيات \n\n*•* عدد المجموعات المفعله : '..redis:scard(max..'group:ids')..'\n*•* عدد المشتركين في البوت : '..redis:scard(max..'users')..' '
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام" then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then 
return "• اوامر الردود مقفوله من قبل Dev  " end
redis:setex(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(max..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "• حسناً ، الآن ارسل كلمة الرد العام"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط" end
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
return '• لايوجد ردود ليتم مسحها'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'ردود MR' then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then 
return "• اوامر الردود مقفوله من قبل Dev  " end
local names 	= redis:exists(max..'replay:all')
local photo 	= redis:exists(max..'replay_photo:group:')
local voice 	= redis:exists(max..'replay_voice:group:')
local imation 	= redis:exists(max..'replay_animation:group:')
local audio 	= redis:exists(max..'replay_audio:group:')
local sticker 	= redis:exists(max..'replay_sticker:group:')
local video 	= redis:exists(max..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(max..'replay:all',max..'replay_photo:group:',max..'replay_voice:group:',max..'replay_animation:group:',max..'replay_audio:group:',max..'replay_sticker:group:',max..'replay_video:group:')
return "• تم مسح ردود MR"
else
return "• لايوجد ردود من MR ليتم مسحها"
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then 
return "• اوامر الردود مقفوله من قبل Dev  " end
redis:set(max..'delrdall:'..msg.sender_user_id_,true) 
return "• حسناً\n• الآن ارسل الرد ليتم مسحه من المجموعات"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
redis:set(max..'delrd:'..msg.sender_user_id_,true)
return "• حسناً \n• الآن ارسل الرد ليتم مسحه \n"
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
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
local names  	= redis:hkeys(max..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(max..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(max..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(max..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(max..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(max..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(max..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '*•* لايوجد ردود مضافه حالياً' 
end
local ii = 1
local message = '*•* ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== ' ردود MR' or MsgText[1]=='الردود العامه' then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then
return "• اوامر الردود مقفوله من قبل Dev  " end
local names 	= redis:hkeys(max..'replay:all')
local photo 	= redis:hkeys(max..'replay_photo:group:')
local voice 	= redis:hkeys(max..'replay_voice:group:')
local imation 	= redis:hkeys(max..'replay_animation:group:')
local audio 	= redis:hkeys(max..'replay_audio:group:')
local sticker 	= redis:hkeys(max..'replay_sticker:group:')
local video 	= redis:hkeys(max..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '*•* لايوجد ردود مضافه حالياً ' 
end
local ii = 1
local message = '*•*ردود MR في البوت : \n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end
----=================================|كود الرد العشوائي العام|===============================================

if MsgText[1]=="اضف رد متعدد عام" then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then 
return "• اوامر الردود مقفوله من قبل Dev  " end
redis:setex(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:del(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return "• حسناً ,  الآن ارسل كلمة الرد المتعدد العام \n"
end

if MsgText[1]== "مسح رد متعدد عام" then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then
return "• اوامر الردود مقفوله من قبل Dev  " end 
redis:setex(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,300,true)
return "• حسناً  \n• الآن ارسل الرد المتعدد العام ليتم مسحه \n"
end

if MsgText[1] == "مسح الردود المتعدده العامه" then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then 
return "• اوامر الردود مقفوله من قبل Dev  " end
local AlRdod = redis:smembers(max..':KlmatRRandom:') 
if #AlRdod == 0 then return "*•* الردود المتعدده العامه محذوفه مسبقاً \n" end
for k,v in pairs(AlRdod) do redis:del(max..":ReplayRandom:"..v) redis:del(max..':caption_replay:Random:'..v)  end
redis:del(max..':KlmatRRandom:') 
return "*•* أهلا عزيزي "..msg.TheRankCmd.."  \n*•* تم مسح الردود المتعدده العامه \n"
end

if MsgText[1] == "الردود المتعدده العامه" then
if not msg.SudoUmath then return"*•* هذا الامر يخص {MR} فقط" end
if not msg.SudoBase and not redis:get(max..'lock_reda') then 
return "• اوامر الردود مقفوله من قبل Dev  " end
message = "| الردود المتعدده العام :\n\n"
local AlRdod = redis:smembers(max..':KlmatRRandom:') 
if #AlRdod == 0 then 
message = message .."• لا توجد ردود متعدده مضافه \n"
else
for k,v in pairs(AlRdod) do
local incrr = redis:scard(max..":ReplayRandom:"..v) 
message = message..k..'- '..v..' :  *'..incrr..'*  رد\n'
end
end
return message.."\n"
end


----=================================|نهايه كود الرد العشوائي العام|===============================================


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "*•* هذا الامر يخص {MR,المالك,المدير} بس  " end
redis:setex(max..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(max..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "• حسناً , الآن ارسل الكلمة التي تريدها"
end

if MsgText[1] == "ضع اسم البوت"  then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط " end
redis:setex(max..'namebot:witting'..msg.sender_user_id_,300,true)
return"• حسناً \n• الآن ارسل اسم للبوت \n"
end



if MsgText[1] == 'server' then
if not msg.SudoUmath then return "For Sudo Only." end
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
if not msg.SudoUmath then return "For Sudo Only." end
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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
local Text = [[
‏‎‏‌‌‏‌‌‌‌‏ ‏‌‌‏‌‌‌‌‏ • ‌‌‏الاوامر العامة‌‏

• م1 - اوامر الحماية‌‏
• م2 - اوامر الاشراف 
• م3 - اوامر التفعيل والتعطيل
• م4 - اوامر الخدمة 
ـــــــــــــــــــــــــــــــــــــــــــــــ

[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]

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
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end
local text =[[

• اوامر الحماية 

• قفل - فتح  : الكل 
• قفل - فتح  : التاق 
• قفل - فتح  : الفيديو 
• قفل - فتح  : الصور 
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

[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]] 
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' or MsgText[1]== 'م٢' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end
local text = [[

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

• مسح الادمنيه - لمسح : الادمنيه 
• مسح المميزين - لمسح : المميزين 
• مسح المدراء - لمسح : المدراء 
ـــــــــــــــــــــــــــــــــــــــــــــــ

• اوامر الوضع 

• ضع رابط
• ضع قوانين
• ضع ترحيب
• ضع تكرار + العدد


[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' or MsgText[1]== 'م٣' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end
local text = [[


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

[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' or MsgText[1]== 'م٤' then
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end
local text = [[
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

[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م5' or MsgText[1]== 'م٥' then 
if not msg.Director then return "*•* هذا الامر يخص {المدير,المالك,MR} فقط  " end 
local text = [[ 
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

 
[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]] 
sendMsg(msg.chat_id_,msg.id_,text) 
return false 
end
if MsgText[1]== 'التسليه' or MsgText[1]== 'التسلية' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end
local text =[[
• اوامر التسليه 

• رفع - تنزيل : تاج
• رفع - تنزيل : زوجتي
• رفع - تنزيل : زق
• رفع - تنزيل : كلب
• رفع - تنزيل : حمار
• رفع - تنزيل : خروف
• رفع - تنزيل : زاحف
• رفع لقلبي - تنزيل من قلبي
• طلاق - زواج

[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'اليوتيوب' or MsgText[1]== 'يوتيوب' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end
local text = [[
• اليوتيوب

• امر التشغيل : تفعيل اليوتيوب 
• امر التعطيل : تعطيل اليوتيوب 

• بحث + اسم الاغنية


[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV) ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'الساوند' or MsgText[1]== 'ساوند' then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط  " end
local text = [[

• الساوند كلاود

• امر التشغيل : تفعيل الساوند 
• امر التعطيل : تعطيل الساوند 

• كلاود + رابط الاغنية 
[• ѕᴏᴜʀᴄᴇѕ ᴘᴇᴛᴇʀ .](https://t.me/VV6YV)  ]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
if not redis:get(max..'lave_me'..msg.chat_id_) then 
return "*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* الطرد مفعل مسبقاً \n" 
else 
redis:del(max..'lave_me'..msg.chat_id_) 
return "*•* أهلا عزيزي  "..msg.TheRankCmd.."\n*•* تم تفعيل الطرد \n" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط " end
if redis:get(max..'lave_me'..msg.chat_id_) then 
return "*•* أهلا عزيزي  "..msg.TheRankCmd.."\n*•* الطرد معطل مسبقاً \n " 
else
redis:set(max..'lave_me'..msg.chat_id_,true)  
return "*•* أهلا عزيزي  "..msg.TheRankCmd.."\n*•* تم تعطيل الطرد \n" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(max..'lave_me'..msg.chat_id_) then
if msg.Admin then return "*•* عذراً لا يمكنني طرد المدراء والادمنيه والمالكين " end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"• هلا بالنفسية , طردتك من المجموعه عشانك طلبت \n• اذا كان ماقصدت او اذا تبي ترجع للمجموعة \n\n• فهذا هو الرابط  \n- "..Flter_Markdown(redis:get(max..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(max..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"• لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"• لا يمكنني طردك لأنك مشرف في المجموعه ")
end
end)
return false
end
end

end 


if MsgText[1] == "التاريخ" then
return "\n• التاريخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "تعديلاتي" then
return '*•* عدد تعديلاتك : '..(redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' '
end

if MsgText[1] == 'مسح' and MsgText[2] == 'تعديلاتي'  then
local rfih = (redis:get(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "*•* عذراً ليس لديك تعديلات " end
redis:del(max..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "*•* تم مسح : "..rfih.." من تعديلاتك "
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط  " end
if redis:get(max..":UserNameChaneel") then
return "•أهلا عزيزي المطور \n• الاشتراك بالتأكيد مفعل"
else
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "• أهلا بك في نظام الاشتراك الاجباري\n• الآن ارسل معرف قناتك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري" then
if not msg.SudoBase then return"*•* أهلا عزيزي  " end
local SubDel = redis:del(max..":UserNameChaneel")
if SubDel == 1 then
return "• تم تعطيل الاشتراك الاجباري "
else
return "• الاشتراك الاجباري بالفعل معطل "
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري" then
if not msg.SudoBase then return"*•* أهلا عزيزي " end
local UserChaneel = redis:get(max..":UserNameChaneel")
if UserChaneel then
return "• أهلا عزيزي المطور \n• الاشتراك الاجباري للقناة : "..UserChaneel..""
else
return "• لا يوجد قناة مفعله على الاشتراك الاجباري "
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري" then
if not msg.SudoBase then return"*•* هذا الامر يخص {MR} فقط" end
redis:setex(max..":ForceSub:"..msg.sender_user_id_,350,true)
return "• أهلا بك في نظام الاشتراك الاجباري\n• الآن ارسل معرف قناتك"
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

if not msg.Kara then return "• هذا الامر يخص {المالك,MR} فقط" end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'• البوت ليس لديه  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'• الأسم : '..data.first_name_..'\n• تم رفعه ليصبح مشرف بكامل الصلاحيات\n‏‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'رفع مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "• هذا الامر يخص {المالك الاساسي،MR} فقط" end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'• البوت ليس لديه  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'المستخدم : '..data.first_name_..'\n• تم رفعه مشرف \n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "• هذا الامر يخص {المالك الاساسي،MR} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'• البوت ليس لديه  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'• المستخدم : '..data.first_name_..'\n• تم التنزيل مشرف\n‏')

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
sendMsg(msg.chat_id_,msg.id_,'• أهلا عزيزي \n• تم تثبيت الامر الجديد \n')
redis:del(max..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end


if Black:match('^تغيير امر (.*)') then
if not msg.Kara then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
local cmd = Black:match('^تغيير امر (.*)') 
redis:setex(max..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'• أهلا عزيزي\n• ارسل الامر الذي تريد تغييره بدال : '..cmd..'\n')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.Kara then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
local cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(max..'CmD:'..msg.chat_id_,cmd)
redis:srem(max..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"\n• أهلا عزيزي\n• الامر : "..cmd.."\n• تم مسحه من قائمة الاوامر \n")
end
if Black == 'مسح قائمة الاوامر' or Black == 'مسح قائمة الاوامر' then
if not msg.Kara then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
redis:del(max..'CmD:'..msg.chat_id_)
redis:del(max..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم مسح قائمة الاوامر")
end
if Black == "قائمة الاوامر" then
if not msg.Kara then return "*•* هذا الامر يخص {المالك,MR} فقط  " end
local CmDlist = redis:smembers(max..'CmDlist:'..msg.chat_id_)
local t = '• قائمة الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(max..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '• لم تقم بأضافة  اي امر'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if not msg.Admin then return sendMsg(msg.chat_id_,msg.id_,"*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط") end
if redis:get(max..'welc'..msg.chat_id_) then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب مسبقاً')
else
redis:set(max..'welc'..msg.chat_id_,'on')
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if not msg.Admin then return sendMsg(msg.chat_id_,msg.id_,"*•* هذا الامر يخص {الادمن,المدير,المالك,MR} فقط") end
if not redis:get(max..'welc'..msg.chat_id_) then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب مسبقاً')
else
redis:del(max..'welc'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب')
end
end




if Text == "join on" and msg.SudoUmath then
redis:set(max..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(max..'setchs') and msg.SudoUmath then
redis:set(max..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(max..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUmath then
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
sendMsg(msg.chat_id_,msg.id_,'• عذراً \n• الامر فقط للصوره')
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
sendMsg(msg.chat_id_,msg.id_,'• عذراً \n• الامر فقط للملصق')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUmath then
local msg_pv = tonumber(redis:get(max..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(max..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*•* تم حظرك من البوت') 
end
redis:setex(max..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end
if msg.text=="الاضافات" then
if msg.SudoBase then
local text = '• أهلا بك عزيزي Dev في قسم الاضافات'
local keyboard = {
{"اضف كت","حذف كت"},
{"حذف صوت","اضف صوت"},
{"العوده"},
{"الغاء الامر "}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
end
end

if msg.text=="/start" or msg.text=="العوده" then 

if msg.SudoBase then
local text = '• أهلا بك عزيزي Dev .'
local keyboard = {
{"ضع اسم البوت","ضع صوره الترحيب"},
 {"تعطيل التواصل","تفعيل التواصل"},
{"تعطيل البوت خدمي","تفعيل البوت خدمي","قائمة MR"},
 {"المشتركين","المجموعات","الاحصائيات"},
 {"اضف رد عام","الردود العامه"},
 {"اذاعه","اذاعه خاص"},
{"اذاعه عام","اذاعه عام بالتوجيه"},
 {"تحديث","قائمة العام","ايدي"},
{"تعطيل الاشتراك الاجباري","تفعيل الاشتراك الاجباري"},
{"تغيير الاشتراك الاجباري","الاشتراك الاجباري"},
{"تنظيف المشتركين","تنظيف المجموعات"},
 {"نسخه احتياطيه للمجموعات"},
  {"الاضافات"},
  {"الغاء الامر "}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(max..'users',msg.sender_user_id_)
if redis:get(max..'lock_service') then 
text = [[• أهلا بك عزيزي انا بوت اسمي []]..redis:get(max..':NameBot:')..[[] .
• اختصاص البوت حماية المجموعات .
• اضف البوت الى مجموعتك .
• ارفع البوت مشرف في المجموعة .
• ارسل تفعيل ليتم التفعيل ورفع المشرفين .

━┉ ┉ ┉ ┉ ┉ ┉ ┉━━┉ ┉ ┉ ┉ ┉ ┉
]]
else
text = [[• أهلا بك عزيزي انا بوت اسمي []]..redis:get(max..':NameBot:')..[[] .
• اختصاص البوت حماية المجموعات .
• اضف البوت الى مجموعتك .
• ارفع البوت مشرف في المجموعة .
• ارسل تفعيل ليتم التفعيل ورفع المشرفين .

━┉ ┉ ┉ ┉ ┉ ┉ ┉━━┉ ┉ ┉ ┉ ┉ ┉
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="• 𝙳𝙴𝚅🎖.",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoUmath then
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

SendMention(msg.sender_user_id_,data.id_,msg.id_,"• تم ارسال الرسالة \n• الى : "..USERNAME.." ",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(max..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"• لا يمكنك ارسال { توجيه‌‏ أو ملصق أو فيديو كام } •")
return false
end
redis:setex(max.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"• ستصل رسالتك للمطور  ")
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
sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الردود المتعدده العامه \n• ارسل *('..klma..')* لتستطيع رؤيتها \n')
redis:del(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end

local CountRdod = redis:scard(max..':ReplayRandom:'..klma) or 1
local CountRdod2 = 250 - tonumber(CountRdod)
local CountRdod = 249 - tonumber(CountRdod)
if CountRdod2 == 0 then 
redis:del(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_)
redis:del(max..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'• وصلت الحد الاقصى لعدد الردود العامه \n• ارسل *('..klma..')* لتستطيع رؤيتها \n')
redis:del(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end
if msg.text then 
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"• عذراً لا يسمح اضافة جواب الرد اكثر من 4000 حرف\n")
end
CaptionInsert(msg,msg.text,true)
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Text:"..msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الرد العام تبقى '..CountRdod..'\n• ارسل رد آخر او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Photo:"..photo_id) 
CaptionInsert(msg,photo_id,true)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الصوره للرد العام تبقى '..CountRdod..' \n• ارسل رد آخر او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageVoice" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Voice:"..msg.content_.voice_.voice_.persistent_id_) 
CaptionInsert(msg,msg.content_.voice_.voice_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة البصمه للرد العام تبقى '..CountRdod..' \n•  ارسل رد آخر او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageAnimation" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Animation:"..msg.content_.animation_.animation_.persistent_id_) 
CaptionInsert(msg,msg.content_.animation_.animation_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة المتحركه للرد العام العام تبقى '..CountRdod..' \n• ارسل رد آخر او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageVideo" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Video:"..msg.content_.video_.video_.persistent_id_) 
CaptionInsert(msg,msg.content_.video_.video_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الفيديو للرد العام تبقى '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageAudio" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Audio:"..msg.content_.audio_.audio_.persistent_id_) 
CaptionInsert(msg,msg.content_.audio_.audio_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الصوت للرد العام تبقى '..CountRdod..' \n• ارسل رد آخر او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageDocument" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Document:"..msg.content_.document_.document_.persistent_id_) 
CaptionInsert(msg,msg.content_.document_.document_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الملف للرد العام تبقى '..CountRdod..' \n• ارسل رد آخر او ارسل (*تم*) \n')  
elseif msg.content_.ID == "MessageSticker" then
redis:sadd(max..':KlmatRRandom:',klma) 
redis:sadd(max..':ReplayRandom:'..klma,":Sticker:"..msg.content_.sticker_.sticker_.persistent_id_) 
CaptionInsert(msg,msg.content_.sticker_.sticker_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الملصق للرد العام تبقى '..CountRdod..' \n• ارسل رد آخر او ارسل (*تم*) \n')
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
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الصوره للرد \n• يمكنك ارسال ['..klma..'] لتستطيع رؤية الصوره الصوره ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة بصمه صوت للرد\n• يمكنك ارسال ['..klma..'] لتستطيع سماع البصمه  ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة المتحركه للرد \n• يمكنك ارسال ['..klma..'] لتستطيع رؤية الصوره المتحركه ')
elseif msg.video then
redis:hset(max..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الفيديو للرد الفيديو\n• يمكنك ارسال ['..klma..'] لتستطيع رؤية الفيديو  الفيديو ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الصوت للرد\n• يمكنك ارسال ['..klma..'] لتستطيع سماع الصوت  ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(max..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافة الملصق للرد \n• يمكنك ارسال ['..klma..'] لتستطيع رؤية الملصق  ')
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
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه صوره للرد العام\n• يمكنك ارسال ['..klma..'] لاظهار الصوره ')
elseif msg.voice then
redis:hset(max..'replay_voice:group:',klma,voice_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه بصمه صوت للرد العام\n• يمكنك ارسال ['..klma..'] لسماع البصمه ')
elseif msg.animation then
redis:hset(max..'replay_animation:group:',klma,animation_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه متحركه للرد العام\n• يمكنك ارسال ['..klma..'] لاظهار الصوره  ')
elseif msg.video then
redis:hset(max..'replay_video:group:',klma,video_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه فيديو للرد العام\n• يمكنك ارسال ['..klma..'] لاظهار الفيديو  ')
elseif msg.audio then
redis:hset(max..'replay_audio:group:',klma,audio_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه للصوت للرد العام\n• يمكنك ارسال ['..klma..'] لاظهار الصوت  ')
elseif msg.sticker then
redis:hset(max..'replay_sticker:group:',klma,sticker_id)
redis:del(max..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• تم اضافه ملصق للرد العام\n• يمكنك ارسال ['..klma..'] لاظهار الملصق ')
end  

end

if msg.text then

if msg.text == "ايدت" then 
ban = math.random(2, 116); 
local Text ='اضغط الزر لتغيير الايدت ' 
keyboard = {}  
keyboard.inline_keyboard = {
{
{text = 'ايدت اخر', callback_data="/help4@"..msg.sender_user_id_},
},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/exddj/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
return false 
end

if msg.text == "افتارات بنات" then 
ban = math.random(55, 211); 
local Text ='اضغطي الزر لتغيير الافتار ' 
keyboard = {}  
keyboard.inline_keyboard = {
{
{text = 'افتار اخر', callback_data="/help1@"..msg.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/avta1/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
return false 
end

if msg.text == "رياكشن" then 
ban = math.random(2, 211); 
local Text =' اضغط الزر لتغيير الرياكشن' 
keyboard = {}  
keyboard.inline_keyboard = {
{
{text = 'رياكشن اخر', callback_data="/help3@"..msg.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/gafffg/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
return false 
end

if msg.text == "افتارات عيال" then 
ban = math.random(2, 250); 
local Text ='اضغط الزر لتغيير الافتار ' 
keyboard = {}  
keyboard.inline_keyboard = {
{
{text = 'افتار اخر', callback_data="/help2@"..msg.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/avtfbb/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
return false 
end

--====================== Requst UserName Of Channel For ForceSub ==============


local Text = msg.text
local UserID =  msg.sender_user_id_
if msg.SudoBase then
if Text == "تعيين الايدي عام" then
redis:setex(max.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
local hasnid= [[
• حسناً , ارسل كليشه الايدي .
• الاختصارات كالتالي : 
 
{الايدي} - لاظهار الايدي .
{اليوزر} - لاظهار المعرف . 
{الرتبه}  - لاظهار الرتبه . 
{التفاعل} - لاظهار التفاعل .
{الرسائل} - لاظهار عدد الرسائل .
{نقاطك} - لاظهار عدد النقاط .
{التعديل} - لاظهار عدد التعديلات .
{البايو} - لاظهار البايو .


- [للمزيد من الايديات](https://t.me/ZXXC1)

]]
return sendMsg(msg.chat_id_,msg.id_,hasnid) 
end

if Text and Text:match('^تقييد (%d+) (.*) @(.*)$') and msg.Admin then
local TextEnd = {string.match(Text, "^(تقييد) (%d+) (.*) @(.*)$")}
if msg.can_be_deleted_ == false then 
sendMsg(msg.chat_id_, msg.id_,"• عذراً قم برفع البوت مشرف") 
return false  
end
function FunctionStatus(arg, result)
if (result.id_) then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
sendMsg(msg.chat_id_,msg.id_,"• عذراً ذلك معرف قناة ")   
return false 
end      

if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.id_, msg.chat_id_) then
sendMsg(msg.chat_id_, msg.id_, "\n• عذراً لا تستطيع تقييد : "..Getrtba(result.id_,msg.chat_id_).."")
else
if TextEnd[3] == "ايام" or TextEnd[3] == 'دقايق' or TextEnd[3] == 'ساعات' then
GetUserID(result.id_,function(arg,data)
local Teext = '• المستخدم : ['..data.first_name_..'](tg://user?id='..result.id_..')\n• تم تقييده لمدة : '..TextEnd[2]..' '..TextEnd[3]..''
local msg_id = msg.id_/2097152/0.5
https.request(ApiToken..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Teext).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end,nil)
https.request("https://api.telegram.org/bot"..Token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, FunctionStatus, nil)
end
if Text and Text:match('^تقييد (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and msg.Admin then
local TextEnd = {string.match(Text, "^(تقييد) (%d+) (.*)$")}
if msg.can_be_deleted_ == false then 
sendMsg(msg.chat_id_, msg.id_,"• عذراً قم برفع البوت مشرف") 
return false  
end
function FunctionStatus(arg, result)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
sendMsg(msg.chat_id_, msg.id_, "\n• عذراً لا تستطيع تقييد : "..Getrtba(result.sender_user_id_,msg.chat_id_).."")
else
if TextEnd[3] == "ايام" or TextEnd[3] == 'دقايق' or TextEnd[3] == 'ساعات' then
GetUserID(result.sender_user_id_,function(arg,data)
local Teext = '• المستخدم : ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\n• تم تقييده لمدة : '..TextEnd[2]..' '..TextEnd[3]..''
local msg_id = msg.id_/2097152/0.5
https.request(ApiToken..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Teext).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end,nil)
https.request("https://api.telegram.org/bot"..Token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunctionStatus, nil)
return false
end

if Text == "مسح الايدي عام" and msg.SudoBase then
redis:del(max.."KLISH:ID")
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم مسح كليشه الايدي ")
return false  
end

if Text == 'غني' or Text == 'اغنيه' then
if redis:get(max..'gne'..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,'• تم إيقاف امر غني من قبل الاداره .')
end
local list = redis:smembers(max.."sot")
if #list ~= 0 then
local quschen = list[math.random(#list)]
sendVoice(msg.chat_id_,msg.id_,quschen)
end
end

if Text == "اضف سوال كت تويت" or Text == "اضف كت" then
if not msg.SudoBase then return"• هذا الامر يخص  Dev فقط  \n" end
redis:set(max.."addkt"..msg.sender_user_id_..":"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"ارسل السؤال الان ")
end
if Text == "حذف سوال كت تويت" or Text == "حذف كت" then
if not msg.SudoBase then return"• هذا الامر يخص  Dev فقط  \n" end
redis:set(max.."dletkt"..msg.sender_user_id_..":"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"ارسل السؤال ")
end

if msg.text and msg.text:match("^(.*)$") then
if redis:get(max.."dletkt"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
sendMsg(msg.chat_id_,msg.id_,'\nتم حذف السؤال بنجاح')
redis:set(max.."dletkt"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu")
redis:srem(max.."kit", msg.text)
return false end
end


if Text == 'تفعيل غني'  then   
if not msg.Admin then return
sendMsg(msg.chat_id_, msg.id_,"• الامر يخص الادمنيه فقط ") 
end 
redis:del(max..'gne'..msg.chat_id_) 
Text = '\n• تم تفعيل غني بنجاح' 
sendMsg(msg.chat_id_, msg.id_,Text) 
end
if Text == 'تعطيل غني' then  
if not msg.Admin then return
sendMsg(msg.chat_id_, msg.id_,"• الامر يخص الادمنيه فقط ") 
end
redis:set(max..'gne'..msg.chat_id_,true) 
Text = '\n • تم تعطيل غني بنجاح' 
sendMsg(msg.chat_id_, msg.id_,Text) 
end 


if Text == "اضف اغنيه" or Text == "اضف صوت" then
if not msg.SudoBase then return"• هذا الامر يخص  Dev فقط  \n" end
redis:set(max.."addsot"..msg.sender_user_id_..":"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"ارسل الصوت الان ")
end
if Text == "حذف اغنيه" or Text == "حذف صوت" then
if not msg.SudoBase then return"• هذا الامر يخص  Dev فقط  \n" end
redis:set(max.."dlsot"..msg.sender_user_id_..":"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"ارسل الصوت ")
end

if redis:get(max.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if Text == "الغاء" then 
sendMsg(msg.chat_id_,msg.id_,"*• تم الغاء الامر *")
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end 
redis:del(max.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = Text:match("(.*)")  
redis:set(max.."KLISH:ID",CHENGER_ID)
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
Text = '• الشخص اللي اضافك هو : '..Name
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
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم تفعيل امر مين ضافني \n")
redis:del(max..'Added:Me'..msg.chat_id_)  
else
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* امر مين ضافني مفعل مسبقاً \n ")
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ضافني' then  
if not redis:get(max..'Added:Me'..msg.chat_id_) then
redis:set(max..'Added:Me'..msg.chat_id_,true)  
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* تم تعطيل امر مين ضافني\n")
else
sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRankCmd.."\n*•* امر مين ضافني معطل مسبقاً \n")
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
sendMsg(msg.chat_id_,msg.id_,"• عذراً , يوجد خطأ  \n• المعرف الذي ارسلته ليس معرف قناة")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"• عذراً , لقد نسيت شيئا \n- يجب رفع البوت مشرف في قناتك عشان تقدر تفعل الاشتراك الاجباري .")
return false
end
else
redis:set(max..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"• حلو , الحين لقد تم تفعيل الاشتراك الاجباري\n• على قناتك : ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"• معليش , عزيزي المطور \n• هذا ليس معرف قناة , حاول مجدداً ")
return false
end
end

if redis:get(max..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(max..'namebot:witting'..msg.sender_user_id_)
redis:set(max..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"• تم تغير اسم البوت \n•   اسمه الآن "..Flter_Markdown(msg.text).." ")
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
return sendMsg(msg.chat_id_,msg.id_,"• حسناً , الآن ارسل جواب الرد العام \n• [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]")
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
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد ليس موجود في قائمة الردود')
else
redis:hdel(max..'replay:all',msg.text)
redis:hdel(max..'replay_photo:group:',msg.text)
redis:hdel(max..'replay_voice:group:',msg.text)
redis:hdel(max..'replay_audio:group:',msg.text)
redis:hdel(max..'replay_animation:group:',msg.text)
redis:hdel(max..'replay_sticker:group:',msg.text)
redis:hdel(max..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n • تم مسح الرد  ')
end 
end 


if redis:get(max..'text_sudo:wittingg'..msg.sender_user_id_) then -- استقبال كليشه السورس
redis:del(max..'text_sudo:wittingg'..msg.sender_user_id_) 
redis:set(max..':TEXT_SUDOD',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "• تم وضع الكليشه بنجاح كلاتي \n\n(  "..Flter_Markdown(msg.text).." )")
end

if redis:get(max..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(max..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(max..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "*•* تم وضع الكليشه بنجاح كالتالي\n\n• ( "..Flter_Markdown(msg.text).." )")
end
if redis:get(max..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(max..'welcom:witting'..msg.sender_user_id_) 
redis:set(max..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"*•* تم اضافة الترحيب بنجاح" )
end
if redis:get(max..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(max..'rulse:witting'..msg.sender_user_id_) 
redis:set(max..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'*•*  أهلا عزيزي\n• القوانين مضافه مسبقاً\n• ارسل [[ القوانين ]] لرؤيتها')
end
if redis:get(max..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(max..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(max..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(max..'linkGroup'..msg.sender_user_id_,link) 
redis:set(max..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'• تم انشاء الرابط الجديد ')
end
if redis:get(max..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(max..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"*•* تم اضافة الوصف الجديد")
end 
end,nil)
end


if redis:get(max..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(max..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')  
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• أهلا عزيزي MR \n• جاري نشر التوجيه للمجموعات وللمشتركين ')			
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
return sendMsg(msg.chat_id_,msg.id_,'*•* تم اذاعه الكليشه بنجاح \n*•*للمجموعات : '..#groups..' مجموعة \n*•* للمشتركين : '..#pv..' مشترك')
end

if redis:get(max..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(max..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• أهلا عزيزي MR\n• جاري نشر الرساله للمشتركين ...')			
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
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المشتركين : '..#pv..'\n*•* تم الاذاعه الى : '..SenderOk..' مشترك') 
end
end)
end
end

if redis:get(max..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(max..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(max..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• أهلا عزيزي MR \n• جاري نشر الرساله للمجموعات ')			
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
MsgTDel = '*•* تم مسح : '..NumGroupsDel..' من قائمة الاذاعه لأنهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المجموعات : '..#groups..' \n*•* تم الاذاعه الى : '..AllGroupSend..' \n'..MsgTDel..' ')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(max..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(max..':WELCOME_BOT'),[[• أهلا انا بوت اسمي ]]..redis:get(max..':NameBot:')..[[ 
• اختصاصي حماية المجموعات
• من السبام والتوجية والتكرار

• المطور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 
]])
return false
end 

if msg.forward_info and redis:get(max..'fwd:'..msg.sender_user_id_) then
redis:del(max..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(max..'users')
local groups = redis:smembers(max..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'• أهلا عزيزي MR\n• جاري نشر التوجيه للمجموعات وللمشتركين ')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'*•* تم اذاعه التوجيه بنجاح \n*•* للمجموعات : '..#groups..' \n*•* للخاص : '..#pv..'\n')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'• تم')
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.voice_ and redis:get(max.."dlsot"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
sendMsg(msg.chat_id_,msg.id_,'\nتم حذف الصوت بنجاح')
redis:set(max.."dlsot"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu")
redis:srem(max.."sot", msg.content_.voice_.voice_.persistent_id_)
return false 
end

if redis:get(max.."addkt"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then 
if msg.text == "تم" then   
sendMsg(msg.chat_id_,msg.id_, "\n• تم حفظ جميع اسئله الكت") 
redis:del(max.."addkt"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu") 
return false
end 
if msg.content_.text_ then
sendMsg(msg.chat_id_,msg.id_,'\nتم حفظ السؤال بنجاح للانتهاء ارسل `تم`')
redis:sadd(max.."kit", msg.text)
return false end
end

if redis:get(max.."addsot"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then 
if msg.text == 'تم' then
redis:del(max.."addsot"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu")
sendMsg(msg.chat_id_,msg.id_,'\nتم حفظ جميع الاصوات بنجاح')
end  
if msg.content_.voice_ then
sendMsg(msg.chat_id_,msg.id_,'\nتم حفظ الصوت بنجاح للانتهاء ارسل `تم`')
redis:sadd(max.."sot", msg.content_.voice_.voice_.persistent_id_)
end return false 
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
sendMsg(arg.chat_id_,arg.id_,'• ليس لدي صلاحيه تغيير الصوره \n• يجب فتح صلاحية تغيير معلومات المجموعه')
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
return sendMsg(msg.chat_id_,msg.id_,"• حسناً ، الآن ارسل الجواب الذي تريده للرد \n [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]")
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
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد ليس مضاف في قائمة الردود ')
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
return sendMsg(msg.chat_id_,msg.id_,"*•* عذراً التثبيت معطل من الاداره ")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"*•* عذراً التثبيت معطل من الاداره ")      
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
return sendMsg(msg.chat_id_,msg.id_," قام : "..UserName.." بتغيير صورة المجموعة\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(max..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"• قام : "..UserName.." \n• بتغيير اسم المجموعه\n• الى "..Flter_Markdown(msg.content_.title_).." ") 
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
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "• أهلا عزيزي\n• أنرت المجموعه")
welcome = welcome:gsub("{القوانين}", redis:get(max..'rulse:msg'..msg.chat_id_) or "- الابتعاد عن الألفاظ القذرة.\n- الابتعاد عن العنصرية.\n- عدم نشر صور ومقاطع غير اخلاقية.\n- احترام مالك المجموعه واعضاء المجموعه")
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف ' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(max..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
return false
else
GetUserID(msg.sender_user_id_,function(arg,data)
welcome = (redis:get(max..'welcome:msg'..msg.chat_id_) or "• أهلا عزيزي\nأنرت المجموعه ")
welcome = welcome:gsub("{القوانين}", redis:get(max..'rulse:msg'..msg.chat_id_) or "• الابتعاد عن الألفاظ القذرة\n• الابتعاد عن العنصرية\n• عدم نشر صور ومقاطع غير اخلاقية\n• احترام مالك القروب واعضاء القروب")
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
SendMention(msg.chat_id_,datau.id_,msg.id_,"• المستخدم : "..USERNAME.."\n• قمت بتكرار اكثر من : "..NUM_MSG_MAX.." رسالة , لذا تم تقييدك من المجموعه‌‏ ✓",12,USERCAR) 
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
return sendMsg(msg.chat_id_,msg.id_,'• صلاحياته منشئ المجموعه \n ')   
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
return sendMsg(chat,msg.id_,'• الرتبة : مشرف \n• الصلاحيات هي \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n• تغير معلومات المجموعه • : '..info..'\n• حذف الرسائل • : '..delete..' \n• حظر المستخدمين • : '..restrict..'\n• دعوة مستخدمين • : '..invite..'\n• تثبيت الرسائل • : '..pin..'\n• اضافة مشرفين جدد • : '..promote..'\n\n• ملاحظه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(max..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'*•* لايمكنني مسح الرساله المخالفه\n*•* ليس لدي صلاحية المسح \n')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) and not redis:get(max..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع اعادة التوجيه  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه\n*•* ليس لدي صلاحيه المسح ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(max..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً الانلاين مقفول  "
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"• المستخدم : "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل بس
if utf8.len(msg.text) > 500 and redis:get(max..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• ممنوع ترسل الكليشه  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•*ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال روابط  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال روابط الويب   "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال تاق "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال معرف   "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•*ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الماركدوان  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•*ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال روابط الويب   "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع التعديل "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الفيديو كام"
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الصور  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الفيديو  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(max..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الملفات  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الملصقات  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الصور المتحركه  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(max..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال جهات الاتصال  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الموقع  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
 if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال البصمات  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً الالعاب معطله حالياً  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه المسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال صوت  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* ليس لدي صلاحيه مسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً الكيبورد مقفل  "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه\n*•* ليس لدي صلاحيه مسح \n•')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال الروابط هنا "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه\n*•* لدي صلاحيه مسح ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "• عذراً ممنوع ارسال روابط الويب هنا "
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
return sendMsg(msg.chat_id_,msg.id_,'*•* لا يمكنني مسح الرساله المخالفه .\n*•* لدي صلاحيه الحذف ')    
end
if redis:get(max..'lock_woring'..msg.chat_id_) then
local msgx = "عذراً ممنوع ارسال التاق او المعرف هنا "
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

if msg.text and redis:get(max.."lock_RandomRdod"..msg.chat_id_) then
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
if msg.SudoUmath and msg.text and redis:get(max..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_) then 
if not redis:get(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then return sendMsg(msg.chat_id_,msg.id_,"• عذراً لايمكنك اضافة اكثر من 25 حرف كلمة رد \n•") end
redis:setex(max..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(max..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"• حسناً ، الآن ارسل جواب الرد المتعدد العام \n• ([ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]) \n• يمكنك تضيف 10 ردود متعدده فقط  \n•")
end
end

if  msg.SudoUmath and msg.text and redis:get(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(max..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(max..':ReplayRandom:'..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد ليس مضاف في قائمة الردود المتعدده ')
end
redis:del(max..':caption_replay:Random:'..msg.text) 
redis:srem(max..':KlmatRRandom:',msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'*•* تم مسح الرد \n')
end
--=============================================================================================================================
if not Replay and not redis:get(max..'replayall'..msg.chat_id_) then




local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUmath and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUmath and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"لا استطيع قول اكثر من 500 حرف ")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
if callback_Text and callback_Text == 'الاسم سبام' then
return sendMsg(msg.chat_id_,msg.id_,"• عذراً النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif msg.SudoUmath and Text=="هاي" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif not msg.SudoUmath and Text=="هاي" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif not msg.SudoUmath and Text== "اخباركم" or Text== "اخبارك" or Text== "شلونكم" or Text== "كيفكم" or Text== "شلونك" then
return sendMsg(msg.chat_id_,msg.id_,sss[math.random(#sss)])
elseif not msg.SudoUmath and Text==" باي" or Text == "باي" then
return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
elseif not msg.SudoUmath and Text==" " or Text == "" then
return sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)])
elseif msg.SudoUmath and Text== "احبك" then 
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.SudoUmath and Text== "تحبني" or Text=="تحبني" then 
return sendMsg(msg.chat_id_,msg.id_," لا احب عزيز ")
elseif not msg.SudoUmath and Text== "احبك" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUmath and Text== "تحبdkwmkdيومثني" then
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
elseif Text== "رفع زق"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم رفع العضو زق المجموعه بنجاح\n• تمت إضافته إلى قائمه الزق️")
elseif Text== "تنزيل زق"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم تنزيل العضو من الزق المجموعه\n• تمت الزاله من قامة الزق️")
elseif Text== "رفع كلب"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم رفع العضو إلى كلب بنجاح\n• تمت إضافته إلى قائمه الكلاب️")
elseif Text== "رفع حمار"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم رفع العضو إلى حمار بنجاح\n• تمت إضافته إلى قائمه الحمير")
elseif Text== "تنزيل حمار"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم تنزيل العضو حمار بنجاح\n• تمت ازالته من قائمه الحمير")
elseif Text== "تنزيل كلب"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي \n• تم تنزيل العضو كلب بنجاح\n• تمت إزالته من قائمه الكلاب️")
elseif Text== "تنزيل زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم تنزيل العضو زاحف بنجاح\n• تمت ازالته من قائمه الزواحف️")
elseif Text== "رفع ماعز"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم رفع العضو ماعز بنجاح\n• الآن اصبح ماعز المجموعه ️")
elseif Text== "تنزيل ماعز"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم تنزيل العضو ماعز بنجاح\n• تمت ٳزالته من قائمة المواعز️")
elseif Text== "رفع لقلبي"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم رفع العضو داخل قلبك\n• تمت ترقيته بنجاح ️")
elseif Text== "تنزيل من قلبي"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم تنزيل من داخل قلبك\n• تمت ازالته من قائمه القلوب️")
elseif Text== "رفع تاج"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم رفع العضو تاج بنجاح \n• اصبح تاج المجموعه")
elseif Text== "تنزيل تاج"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم تنزيل العضو\n• من قائمة التاج بنجاح ")
elseif Text== "رفع زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم رفع العضو زوجتك بنجاح\n•الآن يمكنكم أخذ راحتكم️")
elseif Text== "تنزيل زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم تنزيل  زوجتك بنجاح\n•الآن انتم مفترقان️")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم زواجكم الاثنين بنجاح\n• الآن يمكنكم أخذ راحتكم️")
elseif Text== "طلاق"  then return sendMsg(msg.chat_id_,msg.id_,"• أهلا عزيزي\n• تم طلاق الخاينه بنجاح\n• الآن هي مطلقه ")
elseif Text== "اوامر التسليه"  then return sendMsg(msg.chat_id_,msg.id_,"\n• أهلا عزيزي\n• إليك اوامر التسليه كالتالي :\n----------------------\n• رفع - تنزيل : تاج\n• رفع - تنزيل : زوجتي\n• رفع - تنزيل : زق\n• رفع - تنزيل : كلب\n• رفع - تنزيل : حمار\n• رفع - تنزيل : خروف\n• رفع - تنزيل : زاحف\n• رفع لقلبي - تنزيل من قلبي\n• طلاق - زواج\n•••")

elseif Text== " " then  
return sendMsg(msg.chat_id_,msg.id_," ") 
elseif Text== "ايديي" or Text=="ايدي 🆔" then  
GetUserID(msg.sender_user_id_,function(arg,data) 
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end 
local USERCAR = utf8.len(USERNAME) 
SendMention(msg.chat_id_,data.id_,msg.id_,"• اضغط على الايدي ليتم نسخه\n\n "..USERNAME.." - ( "..data.id_.." )",37,USERCAR)   
return false 
end)
elseif Text=="ابي رابط الحذف" or Text=="اريد رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
*•* رابط حذف حـساب التلقرام   
• [اضغط هنا لحذف حسابك](https://telegram.org/deactivate)


 ]] )
--=====================================
elseif Text== " " or Text== " " or Text==" " then
if msg.SudoUmath then  
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
if not ExpireDate and not msg.SudoUmath then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'• انتهى الاشتراك في احد المجموعات \n• المجموعه : '..FlterName(redis:get(max..'group:name'..msg.chat_id_))..'\n• ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'• انتهى الاشتراك البوت \n• سوف اغادر المجموعه \n• او راسل المطور للتجديد '..SUDO_USER..' ')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(max..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUmath then
sendMsg(msg.chat_id_,' باقي يوم واحد وينتهي الاشتراك \n• راسل المطور للتجديد '..SUDO_USER..'\n•')
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
"^(ضع شرط التفعيل) (%d+)$",
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
"^(ضع اسم)$",
"^(ضع وصف)$",
"^(@all)$",
"^(@all (.*))$",
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
'^(ضع تكرار) (%d+)$',
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
"^(رفع MR)$",
"^(رفع MR) (@[%a%d_]+)$",
"^(رفع MR) (%d+)$",
"^(تنزيل MR)$",
"^(تنزيل MR) (%d+)$",
"^(تنزيل MR) (@[%a%d_]+)$",

"^(رفع M)$",
"^(رفع M) (@[%a%d_]+)$",
"^(رفع M) (%d+)$",
"^(تنزيل M)$",
"^(تنزيل M) (%d+)$",
"^(تنزيل M) (@[%a%d_]+)$",
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
"^(ضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(رابط)$",
"^(الرابط)$",
"^(ضع رابط)$",
"^(رابط خاص)$",
"^(الرابط خاص)$",
"^(القوانين)$",
"^(ضع القوانين)$",
"^(ضع قوانين)$",
"^(ضع تكرار)$",
"^(ضع التكرار)$",
"^(الادمنيه)$",
"^(منشن الكل)$",
"^(كشف المجموعه)$",
"^(منشن المشرفين)$",
"^(منشن)$",
"^(قائمة المنع)$",
"^(المدراء)$",
"^(المميزين)$",
"^(المكتومين)$",
"^(ضع الترحيب)$",
"^(ضع ترحيب)$",
"^(الترحيب)$",
"^(المالكين)$",
"^(المالك الاساسي)$",
"^(المحظورين)$",
"^(ضع صوره)$",
  "^(ضع صورة)$",
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
"^(صورة الترحيب)$",
"^(ضع كليشه المطور)$",
"^(المطور)$",
"^(شرط التفعيل)$",
"^(قائمة المجموعات)$",
"^(المجموعات)$",
"^(المجموعات)$",
"^(المشتركين)$",
"^(المشتركين)$",
"^(اذاعه)$",
"^(تعطيل الافلام)$",
"^(تفعيل الافلام)$",
"^(فلم) (.+)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$",
"^(اذاعه عام بالتوجيه ??)$", 
"^(اذاعه خاص)$", 
"^(اذاعه عام)$", 
"^(اذاعه)$", 
"^(قائمة العام)$",
"^(قائمة MR)$",
"^(قائمة M)$",
"^(تيست)$",
"^(test)$",
"^(ايديي)$",
"^(قناة السورس)$",
"^(الاحصائيات)$",
"^(الاحصائيات)$",
"^(اضف رد عام)$",
"^(مسح الردود)$",
"^(مسح ردود MR)$",
"^(ضع اسم البوت)$",
"^(مسح الصوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(ردود MR)$",
"^(الردود العامه)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(نظف المشتركين)$",
"^(نظف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(رتبتي)$",
"^(ضع اسم البوت)$",
"^(ضع صوره الترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر)$",
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
"^(الاشتراك الاجباري)$", 
"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 
"^(ضع كليشه السورس)$", 
"^(مسح كليشه السورس)$",
"^(السورس)$",
"^(سورس)$",
"^(مسح كليشه المطور)$",

"^(المالك)$",
"^(م MR)$", 
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
"^(اضف رد متعدد عام)$", 
"^(مسح رد متعدد عام)$", 
"^(الردود المتعدده العامه)$", 
"^(مسح الردود المتعدده العامه)$", 
"^(تعطيل الردود المتعدده)$",
"^(تعطيل الردود المتعددة)$",
"^(تفعيل الردود المتعدده)$",
"^(تفعيل الردود المتعددة)$",
"^(فتح ردود MR)$",
"^(فتح حظر العام)$",
"^(فتح الاحصائيات)$",
"^(قفل ردود MR)$",
"^(قفل حظر العام)$",
"^(قفل الاحصائيات)$",
 },
 imax = imax,
 dmax = dmax,
 }