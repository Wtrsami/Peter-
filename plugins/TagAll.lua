local function TagAll(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if Manager(msg) then
if text == "all" or text == "@all" then
if DevAbs:get(JokerTeam.."Abs:TagAll:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙انتظر دقيقه بعد ارسال الامر', 1, 'md')
return false  
end
DevAbs:setex(JokerTeam..'Abs:TagAll:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = data.member_count_},function(arg,dp)
x = 0
tags = 0
local list = dp.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(extra,result,success)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
TagName = result.first_name_
TagName = TagName:gsub("]","")
TagName = TagName:gsub("[[]","")
t = t..", ["..TagName.."](tg://user?id="..v.user_id_..")"
if x == 1 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end,nil)
end
end
end

end
return {
JokerTeam = TagAll
}
