package api.crypto.decryptFile
{
	import api.crypto.Crypto;

	import api.events.crypto.decryptFile.DecryptFileEvent;

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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_decryptFile.html Northcode Help Documentation
	*/
	public class DecryptFile extends Crypto
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var destination:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var source:String = null;
		
		/**
		* Constructor for Crypto.DecryptFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_decryptFile.html Northcode Help Documentation
		*/
		public function DecryptFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param privateKey
		*
		* @param fromPath
		*
		* @param toPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Crypto_decryptFile.html Northcode Help Documentation
		*/
		public function decryptFile( privateKey:String = null , fromPath:String = null , toPath:String = null ):void
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
									decrypt();
							}
					}
			}
		}
		private function decrypt():void
		{
			ssCore.Crypto.decryptFile( {key:key , source:source , destination:destination}
									  ,{callback:actionComplete, errorSTR:"decryptFileError", code:"18000"} );
		}


	}
}