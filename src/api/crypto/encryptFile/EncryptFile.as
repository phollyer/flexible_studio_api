package api.crypto.encryptFile
{
	import api.crypto.Crypto;

	import api.events.crypto.encryptFile.EncryptFileEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>destination</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DESTINATION
	*/
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Encrypt a file.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_encryptFile.html Northcode Help Documentation
	*/
	public class EncryptFile extends Crypto
	{
		// Required
		/**
		* A fully qualified path to the encrypted file. If the file exists it will be overwritten. If the file does not exist it will be created. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var destination:String = null;
		/**
		* The string that will be used to encrypt the file. You will also need this key to decrypt the file later.
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		/**
		* A fully qualified path to the file to be encrypted. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var source:String = null;
		
		/**
		* Constructor for Crypto.EncryptFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_encryptFile.html Northcode Help Documentation
		*/
		public function EncryptFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Encrypt a file.
		*
		*
		* @param privateKey
		*
		* @param fromPath
		*
		* @param toPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_encryptFile.html Northcode Help Documentation
		*/
		public function encryptFile( privateKey:String = null , fromPath:String = null , toPath:String = null ):void
		{
			key = compareStrings( privateKey , key );
			destination = compareStrings( toPath , destination );
			source = compareStrings( fromPath , source );
			
			switch( key )
			{
				case null:
					missingKey();
					break;
				default:
					switch( source )
					{
						case null:
							missingSource();
							break;
						default:
							switch( destination )
							{
								case null:
									missingDestination();
									break;
								default:
									encrypt();
							}
					}
			}
		}
		private function encrypt():void
		{
			ssCore.Crypto.encryptFile( {key:key , source:source , destination:destination}
									  ,{callback:actionComplete, errorSTR:"encryptFileError", code:"18002"} );
		}


	}
}