local COIN_SUB_TYPE_TO_VALUE = {
    [CoinSubType.COIN_NULL] = 0,
    [CoinSubType.COIN_PENNY] = 1,
    [CoinSubType.COIN_NICKEL] = 5,
    [CoinSubType.COIN_DIME] = 10,
    [CoinSubType.COIN_DOUBLE_PACK] = 2,
    [CoinSubType.COIN_LUCKY_PENNY] = 1,
    [CoinSubType.COIN_STICKY_NICKEL] = 5,
    [CoinSubType.COIN_GOLDEN] = 1,
}


---Helper function to get the corresponding coin amount from a `CoinSubType`. Returns 1 for modded sub-types.
---@param coinSubType CoinSubType
---@return integer
function TSIL.Pickups.GetCoinValue(coinSubType)
    local coinValue = COIN_SUB_TYPE_TO_VALUE[coinSubType]

    if not coinValue then return 1 end
    return coinValue
end