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
}

struct MemberProfile {
    1 :i32 memberId = 0,
    2 :string username = "",
    3 :string reverseInfo = "",
    4 :MemberPersonalInfo MemberPersonalInfo,
    5 :MemberAddress memberAddress,
    6 :MemberContact memberContact,
    7 :MemberSetting memberSetting,
}

struct BaseResponse {
    1 :string code = "",
}

struct MemberIdResponse {
    1 :string code = "",
    2 :i32 memberId = 0,
}

struct MemberResponse {
    1 :string code = "",
    2 :optional MemberProfile memberProfile;
}

service MemberEndpoint {
  BaseResponse usernameNotUsed(1:string traceId, 2:string username),
  BaseResponse emailNotUsed(1:string traceId, 2:string email),
  BaseResponse mobileNotUsed(1:string traceId, 2:string mobile),
  BaseResponse register(1:string traceId, 2:MemberProfile memberProfile, 3:string password, 4:string checkCode),
  MemberResponse getMemberProfileById(1:string traceId, 2:i32 id),
  MemberIdResponse getMemberIdByUsername(1:string traceId, 2:string username),
  BaseResponse checkPassword(1:string traceId, 2:i32 memberId, 3:string password),
  BaseResponse checkCheckCode(1:string traceId, 2:i32 memberId, 3:string checkCode),
  BaseResponse modifyMember(1:string traceId, 2:MemberProfile memberProfile),
  BaseResponse modifyPassword(1:string traceId, 2:i32 memberId, 3:string password),
  BaseResponse modifyCheckCode(1:string traceId, 2:i32 memberId, 3:string checkCode),
  BaseResponse modifyReverseInfo(1:string traceId, 2:i32 memberId, 3:string reverseInfo),
}
