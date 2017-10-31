namespace java com.lawsofnature.tennis.rpc
#@namespace scala com.lawsofnature.tennis.rpc

struct Tennis4Result {
    1:i64 gameId = 0,
    2:i16 playType = 0,
    3:string leagueSimpleChineseName = "",
    4:string leagueEnglishName = "",
    5:string aTeamSimpleChineseName1 = "",
    6:string aTeamEnglishName1 = "",
    7:string aTeamSimpleChineseName2 = "-",
    8:string aTeamEnglishName2 = "-",
    9:string bTeamSimpleChineseName1 = "",
    10:string bTeamEnglishName1 = "",
    11:string bTeamSimpleChineseName2 = "-",
    12:string bTeamEnglishName2 = "-",
    13:string startTime = "",
    14:i16 status = 0,
    15:string scores = "-",
    16:string firstSet = "-",
    17:string secondSet = "-",
    18:string thirdSet = "-",
    19:string fourthSet = "-",
    20:string fifthSet = "-",
    21:string roundName = "",
}

struct TennisBaseResponse {
    1:string code,
}

service TennisEndpoint {
  TennisBaseResponse data4Result(1:string traceId, 2:list<Tennis4Result> tennis4ResultList),
}