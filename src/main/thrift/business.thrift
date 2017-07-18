namespace java com.lawsofnature.business.rpc
#@namespace scala com.lawsofnature.business.rpc

struct DepositRequest {
    1 :i64 memberId = 0,
    2 :i16 depositWay = 0,
    3 :string requestAmount = "",
    4 :bool newCard = false,
    5 :bool setDefault = false,
    6 :i64 bankCardId = 0,
    7 :string bankCode = "",
    8 :string bankCardNo = "",
    9 :string bankCardName = "",
    10 :string companyBankCode = "",
}

struct EmployeeConfirmRequest {
    1 :string tradeOrderNo = "",
    2 :string amount = "",
    3 :string bankWater = "",
    4 :string remark = "",
    5 :i64 operatorId = 0,
    6 :string operatorName = "",
}

struct EmployeeConfirmWithdrawRequest {
    1 :string tradeOrderNo = "",
    2 :string bankWater = "",
    3 :string remark = "",
    4 :i64 operatorId = 0,
    5 :string operatorName = "",
}

struct WithdrawRequest {
    1 :i64 memberId = 0,
    2 :string amount = "",
    3 :i64 bankCardId = 0,
}

struct WithdrawOrder {
    1 :string tradeOrderNo = "",
    2 :i64 memberId = 0,
    3 :string memberName = "",
    4 :i16 status = 0,
    5 :string amount = "",
    6 :string bankName = "",
    7 :string cardNo = "",
    8 :string cardName = "",
    9 :string companyBankName = "",
    10 :string companyCardNo = "",
    11 :string companyCardName = "",
    12 :string gmtSuccess = "",
    13 :string gmtCreate = "",
}

struct BusinessBaseResponse {
    1 :string code = "",
}

struct WithdrawResponse {
    1 :string code = "",
    2 :optional WithdrawOrder order,
}

struct TransferInfoResponse {
    1 :string code = "",
    2 :string tradeOrderNo = "",
    3 :string requestAmount = "",
    4 :string companyBankCode = "",
    5 :string companyBankName = "",
    6 :string companyCardName = "",
    7 :string companyCardNo = "",
}

struct DepositOrder{
    1 :string tradeOrderNo = "",
    2 :i16 status = 0,
    3 :i16 depositWay = 0,
    4 :i64 memberId = 0,
    5 :string memberName = "",
    6 :string requestAmount = "",
    7 :string confirmAmount = "",
    9 :string bankName = "",
    10 :string cardName = "",
    11 :string cardNo = "",
    12 :string companyBankName = "",
    13 :string companyCardName = "",
    14 :string companyCardNo = "",
    15 :string remark = "",
    16 :i64 operatorId = 0,
    17 :string operatorName = "",
    18 :string gmtCreate = "",
    19 :string gmtTransfer = "",
    20 :string gmtSuccess = "",
}

struct DepositOrderResponse {
    1 :string code,
    2 :optional DepositOrder order,
}
struct DepositOrdersResponse {
    1 :string code,
    3 :list<DepositOrder> orders,
}

struct DepositOrdersSelectRequest {
    1 :i32 pageNo = 0,
    2 :i32 pageSize = 0,
    3 :string tradeOrderNo = "",
    4 :i64 memberId = 0,
    5 :string memberName = "",
    6 :i16 status = 0,
    7 :i16 depositWay = 0,
    8 :string minAmount = "",
    9 :string maxAmount = "",
    10 :string minDate = "",
    11 :string maxDate = "",
    12 :string selector = "",
}

struct WithDrawOrdersSelectRequest {
    1 :i32 pageNo = 0,
    2 :i32 pageSize = 0,
    3 :string tradeOrderNo = "",
    4 :i64 memberId = 0,
    5 :string memberName = "",
    6 :i16 status = 0,
    7 :i64 cardId = 0,
    8 :string bankCode = "",
    9 :string bankName = "",
    10 :string cardName = "",
    11 :string cardNo = "",
    12 :string minAmount = "",
    13 :string maxAmount = "",
    14 :string minDate = "",
    15 :string maxDate = "",
    16 :string selector = "",
}

struct DepositOrdersPageResponse {
    1 :string code = "",
    2 :i32 pageNo = 0,
    3 :i32 pageSize = 0,
    4 :i32 totalPages = 0,
    5 :i32 totalCount = 0,
    6 :list<DepositOrder> orders,
}

struct WithdrawOrdersPageResponse {
    1 :string code = "",
    2 :i32 pageNo = 0,
    3 :i32 pageSize = 0,
    4 :i32 totalPages = 0,
    5 :i32 totalCount = 0,
    6 :list<WithdrawOrder> orders,
}

struct BankCard{
    1 :i64 cardId = 0,
    2 :i64 memberId = 0,
    3 :string bankCode = "",
    4 :string bankName = "",
    5 :string cardName = "",
    6 :string cardNo = "",
    7 :bool defaultAccount = false,
}

struct BankCardsResponse {
    1 :string code = "",
    2 :list<BankCard> cards,
}

struct BalanceResponse {
    1 :string code = "",
    2 :string totalBalance = "0.00",
    3 :string mayWithdrawalsBalance = "0.00",
    4 :string needBetAmt = "0.00",
}

service BusinessEndpoint {
    BusinessBaseResponse createAccount(1:string traceId, 2:i64 memberId),
    BalanceResponse getBalance(1:string traceId, 2:i64 memberId),
    BankCardsResponse getMemberBankCards(1:string traceId, 2:i64 memberId),
    TransferInfoResponse depositRequest(1:string traceId, 2:DepositRequest request),
    TransferInfoResponse getTransferInfoByTradeOrderNo(1:string traceId, 2:i64 memberId, 3:string tradeOrderNo),
    DepositOrderResponse memberConfirm(1:string traceId, 2:i64 memberId, 3:string tradeOrderNo, 4:string amoutstr, 5:string transferTime),
    DepositOrderResponse getDepositOrderByTradeOrderNo(1:string traceId, 2:string tradeOrderNo),
    DepositOrdersResponse getDepositOrdersByMemberId(1:string traceId, 2:i64 memberId),
    DepositOrdersPageResponse selectDepositOrders(1:string traceId, 2:DepositOrdersSelectRequest request),
    BusinessBaseResponse employeeConfirm(1:string traceId, 2:EmployeeConfirmRequest request),
    WithdrawResponse withdrawRequest(1:string traceId, 2:WithdrawRequest request),
    WithdrawOrdersPageResponse selectWithdrawOrders(1:string traceId, 2:WithDrawOrdersSelectRequest request),
    BusinessBaseResponse employeeConfirmWithdraw(1:string traceId, 2:EmployeeConfirmWithdrawRequest request),
}
