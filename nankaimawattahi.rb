require "date"
require "time"


def home
    fnum = 0
    while fnum < 35 do
        print "*-"
        fnum += 1
    end
    puts 
    puts "何時何分何秒\n      地球が何回回った日"
    puts "        計    算    機    \n（なんじなんぷんなんびょう  ちきゅうがなんかいまわったひ  けいさんき）"
    enum = 0
    while enum < 35 do
        print "*-"
        enum += 1
    end
    puts
    console
end

def console
    while true
        puts "\n----------------------------------------------------------------------"
        print "
        1. 今の時刻で計算（いまのじかんでけいさん）
        2. 時刻を指定して計算（じかんをえらんでけいさん）
        9. 終了（おわる）\n
        1，2，9から番号を選んでください。（ばんごうをえらんでね）
        "
        puts "\n----------------------------------------------------------------------"
        num = gets.chomp
        case
          when '1' == num
            nowTime
            break;
          when '2' == num
            timeSetting
            break;
          when '9' == num
            p "アプリケーションの終了 またあそんでね"
            break;

          else
            puts "にゅうりょくされたすうじがちがうよ。1，2．9のなかからえらんでね"
            #入力待ちに戻る
        end
    end
end

def nowTime
    now = Time.now
    @date = Date.today
    #japanese_week = %w(日 月 火 水 木 土)
    #japanese_week[Date.today.wday]
    japanese_week = []
    japanese_week = ["日", "月", "火", "水", "木", "金", "土"]

    @anstitle = "今の時刻で計算（いまのじかんでけいさん）"
    @anstime = "\n #{now.hour}時#{now.min}分#{now.sec}秒"
    @displaytime = "\n #{now.year}年#{now.month}月#{now.day}日 #{%w(日 月 火 水 木 金 土)[now.wday]}曜日"
    ansconsole
    
end

def ansconsole
    puts "\n----------------------------------------------------------------------"
    puts @anstitle
    puts
     earthRotation
     puts @displaytime
     puts @anstime
     puts "(ちきゅう)  (かい)(まわ)(ひ)"
    ans
    puts "\n----------------------------------------------------------------------"
end

def earthRotation
    #西暦1年からの地球の自転回数を求める（西暦）
    #365.2422×2019年＝737424回
    # 2019年12月31日時点での回数を定義
    num_rotation = 737424

    systemdate = Date.new(2019,12,31,)
    numday = @date - systemdate
    @ans = num_rotation + numday.to_i
  
end

def ans
    p "地球が #{@ans}回、回った日"
end

def timeSetting
    puts "時刻を指定して計算（じかんをえらんでけいさん)"
    puts "西暦を入力（せいれきおしえて）"
    confyear = gets.to_i

    puts "月を入力（なんがつ？）"
    confmonth = gets.to_i
    
    puts "日を入力（なんにち？）"
    confdate = gets.to_i
    
    puts "時を入力(なんじ？)"
    confhour = gets.to_i
    
    puts "分を入力（なんふん？）"
    confmin = gets.to_i
    
    puts "秒を入力（なんびょう？）"
    confsec = gets.to_i
    
    conftime = "#{confyear}-#{confmonth}-#{confdate} #{confhour}:#{confmin}:#{confsec}"
    #String→Timeクラスへの変換
    @date = Date.parse(conftime)
    @time = Time.parse(conftime)

    p @time
    p @time.class

    @anstitle = "時刻を指定して計算（じかんをえらんでけいさん）"
    @anstime = "\n #{@time.hour}時#{@time.min}分#{@time.sec}秒"
    @displaytime = "\n #{@time.year}年#{@time.month}月#{@time.day}日 #{%w(日 月 火 水 木 金 土)[@time.wday]}曜日"
    ansconsole

end

    
home