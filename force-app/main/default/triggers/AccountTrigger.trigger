trigger AccountTrigger on Account (before insert) {
//hello
	AccountHelper.createAccount('test');//Test comment 20-Sep
}