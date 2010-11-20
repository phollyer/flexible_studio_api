package api.compress.inflateFile
{
	import flash.events.IEventDispatcher;

	import api.compress.Compress;
	
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class InflateFile extends Compress
	{
		// Required
		public var destination:String = null;
		public var source:String = null;
		
		public function InflateFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function inflateFile( pathToSource:String = null , pathToDestination:String = null ):void
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
							inflate();
					}
			}
		}
		private function inflate():void
		{
			ssCore.Compress.inflateFile( {destination:destination , source:source} , {callback:actionComplete, errorSTR:"inflateFileError", code:"13002"} ); 
		}

	}
}