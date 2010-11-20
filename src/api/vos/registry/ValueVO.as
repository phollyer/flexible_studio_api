package api.vos.registry
{
	[Bindable]
	public class ValueVO extends Object
	{	
		// Type		
		public static const REG_DWORD:String = "REG_DWORD";
		public static const REG_DWORD_LITTLE_ENDIAN:String = "REG_DWORD_LITTLE_ENDIAN";
		public static const REG_SZ:String = "REG_SZ";
		public static const REG_EXPAND_SZ:String = "REG_EXPAND_SZ";
		public static const REG_BINARY:String = "REG_BINARY";
		public static const REG_MULTI_SZ:String = "REG_MULTI_SZ";
		
		public var rootKey:String = null;
		public var subKey:String = null;
		public var valueName:String = null;
		public var value:String = null;
		public var type:String = null;
		
		public function ValueVO()
		{
			super();
		}
		public function createObject():Object
		{
			var __o:Object = new Object();
			__o.rootKey = rootKey;
			__o.subKey = subKey;
			__o.value = value;
			__o.type = type;
			
			switch( valueName != null )
			{
				case true:
					__o.valueName = valueName;
			}
			
			return __o;
		}
	}
}