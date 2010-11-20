package api.crypto.decryptString
{
	import api.crypto.Crypto;

	import api.events.crypto.decryptString.DecryptStringEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.crypto.decryptString.DecryptStringEvent.RESULT
	*/
	[Event(name="result", type="api.events.crypto.decryptString.DecryptStringEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_decryptString.html Northcode Help Documentation
	*/
	public class DecryptString extends Crypto
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var dataIn:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var dataOut:String = null;
		
		/**
		* Constructor for Crypto.DecryptString()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_decryptString.html Northcode Help Documentation
		*/
		public function DecryptString(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param privateKey
		*
		* @param dataString
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_decryptString.html Northcode Help Documentation
		*/
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

		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			dataOut = r.result;
			
			var e : DecryptStringEvent = new DecryptStringEvent( DecryptStringEvent.RESULT );
			e.data = dataOut;
			dispatchEvent( e );
		}
	}
}