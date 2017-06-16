namespace java com.lawsofnature.sso.rpc
#@namespace scala com.lawsofnature.sso.rpc

struct LoginRequest {
    1:string username = "",
    2:string password = "",
    4 :i16 clientId = 0,
    5 :i64 ip = 0,
    6 :string fingerprint = "",
}

struct SessionResponse {
    1 :string code = "",
    2 :i64 id = 0,
    3 :string token = "",
    4 :string key = "",
    5 :i16 status = 0,
    6 :i64 memberId = 0,
    7 :i16 clientId = 0,
    8 :i64 ip = 0,
    9 :string fingerprint = "",
    10 :i64 gmtUpdate = 0,
    11 :i64 gmtCreate = 0,
}

struct SessionBaseResponse {
    1:string code = "",
}

service SSOEndpoint {
  SessionResponse login(1:string traceId, 2:LoginRequest sessionRequest),
  SessionResponse touchSession(1:string traceId, 2:string token),
  SessionBaseResponse logout(1:string traceId, 2:string token),
}
