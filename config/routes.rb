Rails.application.routes.draw do
  # こちらをrootパスへ変更
  # get 'posts' , to: "posts#index"
  
  root to: 'posts#index'
  
  # 投稿完了のページにはいかないのでnewは削除
  # get "posts/new" , to:"posts#new"
  post 'posts', to: 'posts#create'
end
