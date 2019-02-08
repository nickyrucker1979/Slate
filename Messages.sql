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
  ms.[identity]
from
  [message] ms
where
  ms.status <> 'test'
  and ms.person = ''
;
