package api.crypto.encryptString
{
	import api.crypto.Crypto;

	import api.events.crypto.encryptString.EncryptStringEvent;

	import flash.events.IEventDispatcher;
	
	import api.events.crypto.encryptString.EncryptStringEvent

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
	* @eventType api.events.crypto.encryptString.EncryptStringEvent.RESULT
	*/
	[Event(name="result", type="api.events.crypto.encryptString.EncryptStringEvent")]
	[Bindable]
	/**
	* Encrypt a string.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_encryptString.html Northcode Help Documentation
	*/
	public class EncryptString extends Crypto
	{
		// Required
		/**
		* The data to be encrypted. If the length is not a multiple of 8 spaces will be added to the end of the data buffer and removed when the data is decrypted.
		*
		* @defaultValue <code>null</code>
		*/
		public var dataIn:String = null;
		/**
		* The string that will be used to encode the data. You will also need this key to decrypt your data later.
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		
		// Result
		/**
		* The data to be encrypted. If the length is not a multiple of 8 spaces will be added to the end of the data buffer and removed when the data is decrypted.
		*
		* @defaultValue <code>null</code>
		*/
		public var dataOut:String = null;
		
		/**
		* Constructor for Crypto.EncryptString()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_encryptString.html Northcode Help Documentation
		*/
		public function EncryptString(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Encrypt a string.
		*
		*
		* @param privateKey
		*
		* @param dataString
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_encryptString.html Northcode Help Documentation
		*/
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
			
			var e : EncryptStringEvent = new EncryptStringEvent( EncryptStringEvent.RESULT );
			e.data = dataOut;
			dispatchEvent( e );
		}
	}
}