namespace java com.lawsofnature.sport.rpc
#@namespace scala com.lawsofnature.sport.rpc

struct BetItem {
    1 :i64 id = 0,
    2 :i64 dataId = 0,
    3 :i64 version = 0,
    4 :i16 sportType = 0,
    5 :i16 betType = 0,
    6 :i16 pageType = 0,
    7 :string currentScore = "",
    8 :string odds = "",
    9 :string handicap = "",
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
    9 :string enVs = "",
    10 :bool hasRedCard = false,
    11 : optional SoccerEuropeData europeData,
    12 : list<SoccerAsiaData> asiaDataList,
}

struct CommonSoccerGame {
    1 :i64 id = 0,
    2 :string hostTeamName = "",
    3 :string visitingTeamName = "",
    4 :i32 stage = 0,
    5 :i32 stageSeconds = 0,
    6 :i32 hostTeamGoals = 0,
    7 :i32 visitingTeamGoals = 0,
    8 :string startTime = "",
    9 : list<BetItem> betItemList,
}

struct SoccerLeague {
    1 :i64 id = 0,
    2 :string name = "",
    3 :list<SoccerGame> gameList,
}

struct CommonSoccerLeague {
    1 :i64 id = 0,
    2 :string name = "",
    3 :list<CommonSoccerGame> gameList,
}

struct Soccer{
    1:string code = "",
    2:string lan = "",
    3:string source = "",
    4:list<SoccerLeague> leagueList,
}

struct CommonSoccer{
    1:string code = "",
    2:string lan = "",
    3:string source = "",
    4:list<CommonSoccerLeague> leagueList,
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

struct BetItemValidResponse {
    1 :string code = "",
    2 :i64 gameId = 0,
    3 :i64 leagueId = 0,
    4 :i64 hostTeamId = 0,
    5 :i64 visitingTeamId = 0,
    6 :i16 currentHostGoals = 0,
    7 :i16 currentVisitingGoals = 0,
    8 :string betDesc = "",
}

struct SoccerResultResponse {
    1 :string code = "",
    2 :i64 gameId = 0,
    3 :i16 resultType = 0,
    4 :i16 halfHostGoals = 0,
    5 :i16 halfVisitingGoals = 0,
    6 :i16 hostGoals = 0,
    7 :i16 visitingGoals = 0,
}

struct SoccerWaiting {
    1 :i64 dataId = 0,
    2 :string source = "",
    3 :string startTime = "",
    4 :string dataLeagueName = "",
    5 :string dataHostName = "",
    6 :string dataVisitingName = "",
    7 :string gmtCreate = "",
}

struct SoccerWaitingListResponse {
    1 :string code = "",
    2 :list<SoccerWaiting> soccerWaitings,
}

struct Soccer4Match {
    1 :i64 confirmId = 0,
    3 :string startTime = "",
    4 :string confirmLeagueName = "",
    5 :string confirmHostName = "",
    6 :string confirmVisitingName = "",
}

struct Soccer4MatchListResponse {
    1 :string code = "",
    2 :list<Soccer4Match> soccer4Matches,
}

service SportEndpoint {
  SoccerResponse getSoccer(1:string traceId, 2:string lan),
  SoccerResponse getSoccerLiving(1:string traceId, 2:string lan),
  SportBaseResponse soccerComing(1:string traceId, 2:Soccer soccer),
  SportBaseResponse commonSoccerComing(1:string traceId, 2:CommonSoccer soccer),
  SportBaseResponse soccerLivingComing(1:string traceId, 2:Soccer soccer),
  SportBaseResponse soccerConfirmComing(1:string traceId, 2:list<SoccerConfirm> soccerConfirmList),
  BetItemValidResponse checkWhetherBetItemValid(1:string traceId, 2:BetItem betItem),
  SoccerResultResponse getSoccerResult(1:string traceId, 2:i64 gameId, 3:i16 resultType),
  SportBaseResponse compare(1:string traceId, 2:Soccer bet365Soccer, 3:Soccer one88Soccer),
  SportBaseResponse findChance(1:string traceId, 2:list<SoccerConfirm> soccerConfirmList, 3: Soccer soccer),
  SoccerWaitingListResponse soccerWaitingList(1:string traceId),
  Soccer4MatchListResponse soccer4MatchList(1:string traceId, 2: i64 gameDataId, 3: bool doFilter),
  SportBaseResponse matchSoccer(1:string traceId, 2:i64 dataId, 3:i64 confirmId),
  SportBaseResponse betResponseData(1:string traceId, 2:string betResponse),
}

service SportNotifyEndpoint {
  SportBaseResponse notifySoccer(1:string traceId, 2:string body),
  SportBaseResponse notifySoccerLiving(1:string traceId, 2:string body),
}