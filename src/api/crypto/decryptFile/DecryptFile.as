package api.crypto.decryptFile
{
	import flash.events.IEventDispatcher;
	
	import api.crypto.Crypto;

	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DecryptFile extends Crypto
	{
		// Required
		public var destination:String = null;
		public var key:String = null;
		public var source:String = null;
		
		public function DecryptFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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