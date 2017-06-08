namespace java com.lawsofnature.sport.rpc
#@namespace scala com.lawsofnature.sport.rpc

struct BetItem {
    1 :i64 id = 0,
    2 :i64 version = 0,
    3 :i32 sportType = 0,
    4 :i32 betType = 0,
    5 :string odds = "",
    6 :string handicap = "",
}

struct SoccerAsiaData {
    1 :i32 asiaIndex = 0,
    2 :optional BetItem asiaHostTeam,
    3 :optional BetItem asiaVisitingTeam,
    4 :optional BetItem asiaOver,
    5 :optional BetItem asiaUnder,
    6 :optional BetItem halfAsiaHostTeam,
    7 :optional BetItem halfAsiaVisitingTeam,
    8 :optional BetItem halfAsiaOver,
    9 :optional BetItem halfAsiaUnder,
}

struct SoccerEuropeData {
    1 :optional BetItem europeHostTeam,
    2 :optional BetItem europeVisitingTeam,
    3 :optional BetItem europeDraw,
    4 :optional BetItem halfEuropeHostTeam,
    5 :optional BetItem halfEuropeVisitingTeam,
    6 :optional BetItem halfEuropeDraw,
}

struct SoccerGame {
    1 :i64 id = 0,
    2 :string hostTeamName = "",
    3 :string visitingTeamName = "",
    4 :i32 stage = 0,
    5 :i32 stageSeconds = 0,
    6 :i32 hostTeamGoals = 0,
    7 :i32 visitingTeamGoals = 0,
    8 :string startTime = "",
    9 :optional SoccerEuropeData europeData,
    10 : list<SoccerAsiaData> asiaDataList,
}

struct SoccerLeague {
    1 :i64 id = 0,
    2 :string name = "",
    3 :list<SoccerGame> gameList,
}

struct Soccer{
    1:string code = "",
    2:string lan = "",
    3:list<SoccerLeague> leagueList,
}

struct SoccerConfirm {
    1:i64 gameId = 0,
    2:i64 leagueId = 0,
    3:i64 hostTeamId = 0,
    4:i64 visitingTeamId = 0,
    5:string leagueSimpleChineseName = "",
    6:string leagueTraditionalChineseName = "",
    7:string leagueEnglishName = "",
    8:string hostTeamSimpleChineseName = "",
    9:string hostTeamTraditionalChineseName = "",
    10:string hostTeamEnglishName = "",
    11:string visitingTeamSimpleChineseName = "",
    12:string visitingTeamTraditionalChineseName = "",
    13:string visitingTeamEnglishName = "",
    14:string startTime = "",
    15:string status = "",
    16:i16 hostGoals = 0,
    17:i16 visitingGoals = 0,
}

struct SportBaseResponse {
    1 :string code = "",
}

struct SoccerResponse {
    1 :string code = "",
    2 :string body = "",
}

service SportEndpoint {
  SoccerResponse getSoccer(1:string traceId, 2:string lan),
  SoccerResponse getSoccerLiving(1:string traceId, 2:string lan),
  SportBaseResponse soccerComing(1:string traceId, 2:Soccer soccer),
  SportBaseResponse soccerLivingComing(1:string traceId, 2:Soccer soccer),
  SportBaseResponse soccerConfirmComing(1:string traceId, 2:list<SoccerConfirm> soccerConfirmList),
}