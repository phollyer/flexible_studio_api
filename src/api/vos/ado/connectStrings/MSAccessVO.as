package api.vos.ado.connectStrings
{
	[Bindable]
	public class MSAccessVO extends ConnectStringsVO
	{
		public static const PROVIDER:String = "Microsoft.Jet.OLEDB.4.0";
		
		public var connectString:String = null;
		public var dataSource:String = null;
		public var persistSecurityInfo:Boolean = false;		
		
		public function MSAccessVO()
		{
		}
		public function createString():String
		{
			connectString = "Provider=" + PROVIDER + "; " +
							"Persist Security Info=" + persistSecurityInfo + "; " +
							"Data Source=" + dataSource + ";";
			
			return connectString;
		}
	}
}