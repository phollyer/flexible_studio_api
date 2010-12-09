package api.compress.inflateFile
{
	import api.compress.Compress;

	import api.events.compress.inflateFile.InflateFileEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>destination</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DESTINATION
	*/
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Inflate (decompress) a file.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Compress_inflateFile.html Northcode Help Documentation
	*/
	public class InflateFile extends Compress
	{
		// Required
		/**
		* A fully qualified path to the inflated file. If the file exists it will be overwritten. If the file does not exist it will be created. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var destination:String = null;
		/**
		* A fully qualified path to the deflated file. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var source:String = null;
		
		/**
		* Constructor for Compress.InflateFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Compress_inflateFile.html Northcode Help Documentation
		*/
		public function InflateFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Inflate (decompress) a file.
		*
		*
		* @param pathToSource
		*
		* @param pathToDestination
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Compress_inflateFile.html Northcode Help Documentation
		*/
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