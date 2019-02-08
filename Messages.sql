select top 100
  ms.id,
  ms.recipient,
  ms.delivered,
  ms.updated,
  ms.subject,
  ms.mailing,
  ms.record,
  ms.reply,
  ms.status,
  ms.person,
  ms.[identity],
  msg.sender,
  msg.subject,
  msg.subject2,
  msg.body
from
  [message] ms
  join [message.mailing] msg
    on ms.mailing = msg.id
where
  ms.status <> 'test'
  and ms.person = ''  -- person id
  ;
