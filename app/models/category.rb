class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '野菜・果物' },
    { id: 3, name: 'インスタント食品' },
    { id: 4, name: '冷凍食品' },
    { id: 5, name: '缶詰' },
    { id: 6, name: 'お菓子' },
    { id: 7, name: 'シチュー・カレールウ、レトルト' },
    { id: 8, name: 'ドリンク（ペットボトル・粉末）' },
    { id: 9, name: 'お酒' },
    { id: 10, name: '調味料' },
    { id: 11, name: 'その他' }
  ]
  end