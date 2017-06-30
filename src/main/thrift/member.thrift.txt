namespace java com.lawsofnature.member.rpc
#@namespace scala com.lawsofnature.member.rpc

struct MemberPersonalInfo {
    1 :i16 countryId = 0,
    2 :i16 callId = 0,
    3 :string realname = "",
    4 :string birthday = "",
}

struct MemberAddress {
    1 :string province = "",
    2 :string city = "",
    3 :string address = "",
    4 :string postcode = "",
}

struct MemberContact {
    1 :string email = "",
    2 :string mobile = "",
}

struct MemberSetting {
    1 :i16 languageId = 0,
    2 :i16 timeZone = 0,
    3 :i16 oddsFormat = 0,
    4 :bool hope = true,
}

struct MemberProfile {
    1 :i64 memberId = 0,
    2 :string username = "",
    3 :string reverseInfo = "",
    4 :MemberPersonalInfo MemberPersonalInfo,
    5 :MemberAddress memberAddress,
    6 :MemberContact memberContact,
    7 :MemberSetting memberSetting,
}

struct MemberRegisterEnv {
    1 :i64 ip;
    2 :string fingerprint;
    3 :string agent;
}

struct MemberBaseResponse {
    1 :string code = "",
}

struct MemberIdResponse {
    1 :string code = "",
    2 :i64 memberId = 0,
}

struct MemberResponse {
    1 :string code = "",
    2 :optional MemberProfile memberProfile;
}

struct MemberReverseInfoResponse {
    1 :string code = "",
    2 :string reverseInfo = "";
}

struct MemberAuthResponse {
    1 :string code = "",
    2 :i64 memberId = 0,
    3 :string username = "",
    4 :string password = "",
    5 :i16 status = 0,
    6 :string checkCode = "",
    7 :string reserveInfo = "",
}

service MemberEndpoint {
  MemberBaseResponse usernameNotUsed(1:string traceId, 2:string username),
  MemberBaseResponse emailNotUsed(1:string traceId, 2:string email),
  MemberBaseResponse mobileNotUsed(1:string traceId, 2:string mobile),
  MemberBaseResponse register(1:string traceId, 2:MemberProfile memberProfile, 3:MemberRegisterEnv memberRegisterEnv, 4:string password, 5:string checkCode),
  MemberResponse getMemberProfileById(1:string traceId, 2:i64 id),
  MemberIdResponse getMemberIdByUsername(1:string traceId, 2:string username),
  MemberBaseResponse checkPassword(1:string traceId, 2:i64 memberId, 3:string password),
  MemberBaseResponse checkCheckCode(1:string traceId, 2:i64 memberId, 3:string checkCode),
  MemberBaseResponse modifyMember(1:string traceId, 2:MemberProfile memberProfile),
  MemberBaseResponse modifyPassword(1:string traceId, 2:i64 memberId, 3:string password),
  MemberBaseResponse modifyCheckCode(1:string traceId, 2:i64 memberId, 3:string checkCode),
  MemberBaseResponse modifyReverseInfo(1:string traceId, 2:i64 memberId, 3:string reverseInfo),
  MemberAuthResponse getMemberAuthByUsername(1:string traceId, 2:string username),
  MemberReverseInfoResponse getMemberReverseInfo(1:string traceId, 2:i64 memberId),
}
