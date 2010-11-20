package api.crypto.decryptString
{
	import flash.events.IEventDispatcher;
	
	import api.crypto.Crypto;
	
	import api.events.crypto.decryptString.DecryptStringEvent;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.crypto.decryptString.DecryptStringEvent")]
	[Bindable]
	public class DecryptString extends Crypto
	{
		// Required
		public var dataIn:String = null;
		public var key:String = null;
		
		// Result
		public var dataOut:String = null;
		
		public function DecryptString(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function decryptString( privateKey:String = null , dataString:String = null ):void
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
							decrypt();
					}
			}
		}
		private function decrypt():void
		{
			ssCore.Crypto.decryptString( {key:key , dataIn:dataIn}
										,{callback:actionComplete, errorSTR:"decryptStringError", code:"18001"} );
		}

		override protected function sendResult( r:Object ):void
		{
			dataOut = r.result;
			
			var e : DecryptStringEvent = new DecryptStringEvent( DecryptStringEvent.RESULT );
			e.data = dataOut;
			dispatchEvent( e );
		}
	}
}