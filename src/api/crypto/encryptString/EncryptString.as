package api.crypto.encryptString
{
	import api.crypto.Crypto;
	
	import api.events.crypto.encryptString.EncryptStringEvent
	import flash.events.IEventDispatcher;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.crypto.encryptString.EncryptStringEvent")]
	[Bindable]
	public class EncryptString extends Crypto
	{
		// Required
		public var dataIn:String = null;
		public var key:String = null;
		
		// Result
		public var dataOut:String = null;
		
		public function EncryptString(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function encryptString( privateKey:String = null , dataString:String = null ):void
		{
			key = compareStrings( privateKey , key );
			dataIn = compareStrings( dataString , dataIn );
			
			switch( key )
			{
				case null:
					missingKey();
					break;
				default:
					switch( dataIn )
					{
						case null:
							missingData();
							break;
						default:
							encrypt();
					}
			}
		}
		private function encrypt():void
		{
			ssCore.Crypto.encryptString( {key:key , dataIn:dataIn}
										,{callback:actionComplete, errorSTR:"encryptStringError", code:"18003"} );
		}

		override protected function sendResult( r:Object ):void
		{
			dataOut = r.result;
			
			var e : EncryptStringEvent = new EncryptStringEvent( EncryptStringEvent.RESULT );
			e.data = dataOut;
			dispatchEvent( e );
		}
	}
}