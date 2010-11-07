package api.compress.deflateFile
{
	import flash.events.IEventDispatcher;
	
	import api.compress.Compress;
	
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DeflateFile extends Compress
	{
		// Required
		public var destination:String = null;
		public var source:String = null;
		
		public function DeflateFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function deflateFile( pathToSource:String = null , pathToDestination:String = null ):void
		{
			source = compareStrings( pathToSource , source );
			destination = compareStrings( pathToDestination , destination );
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
							deflateNow();
					}
			}
		}
		private function deflateNow():void
		{
			ssCore.Compress.deflateFile( {destination:destination , source:source} , {callback:actionComplete, errorSTR:"deflateFileError", code:"13001"} ); 
		}

	}
}