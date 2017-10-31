namespace java com.lawsofnature.basketball.rpc
#@namespace scala com.lawsofnature.basketball.rpc

struct Basketball4Result {
    1:i64 gameId = 0,
    2:string leagueSimpleChineseName = "",
    3:string leagueTraditionalChineseName = "",
    4:string leagueEnglishName = "",
    5:string hostTeamSimpleChineseName = "",
    6:string hostTeamTraditionalChineseName = "",
    7:string hostTeamEnglishName = "",
    8:string visitingTeamSimpleChineseName = "",
    9:string visitingTeamTraditionalChineseName = "",
    10:string visitingTeamEnglishName = "",
    11:string startTime = "",
    12:i16 status = 0,
    13:string scores = "",
    14:string firstScores = "",
    15:string secondScores = "",
    16:string thirdScores = "",
    17:string fourthScores = "",
}

struct BasketballBaseResponse {
    1:string code,
}

service BasketballEndpoint {
  BasketballBaseResponse data4Result(1:string traceId, 2:list<Basketball4Result> basketball4ResultList),
}