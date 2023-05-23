
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand =gets.chomp
    
    while true
      if ["0", "1", "2"].include?(input_hand)
        return input_hand.to_i
      else
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand =gets.chomp
      # else それ以外の場合
      end
    end
  end
end
# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
  def hand
    return rand(0..2)
  end
end

class Janken
  
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    if player_hand == enemy_hand
      puts "あいこ"
      return true
      
    elsif
      (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      puts "あなたの勝ちです"
      return false 

    else
      puts "あなたの負けです"
      return false
    end
  end
end
# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    # 変数「next_game」に「true」を代入しましょう。
    next_game = true
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    while next_game
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon