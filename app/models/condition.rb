class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '賞味期限内（１ヶ月以上余裕有り）' },
    { id: 3, name: '賞味期限内（１週間以上余裕有り）' },
    { id: 4, name: '賞味期限内（１週間以内に切れる）' },
    { id: 5, name: '消費期限内（１ヶ月以上余裕有り）' },
    { id: 6, name: '消費期限内（１週間以上余裕有り）' },
    { id: 7, name: '消費期限内（１週間以内に切れる）' },
    { id: 8, name: '賞味期限なし（製造年月日から３年以内）' }
  ]
end
