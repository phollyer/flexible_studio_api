package api.crypto.encryptFile
{
	import flash.events.IEventDispatcher;
	
	import api.crypto.Crypto;

	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class EncryptFile extends Crypto
	{
		// Required
		public var destination:String = null;
		public var key:String = null;
		public var source:String = null;
		
		public function EncryptFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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