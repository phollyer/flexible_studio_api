package api.layout.extractFile
{
	import api.events.layout.extractFile.ExtractFileEvent;

	import api.layout.Layout;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>destination</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DESTINATION
	*/
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_extractFile.html Northcode Help Documentation
	*/
	public class ExtractFile extends Layout
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
		public var resource:String = null;
		
		/**
		* Constructor for Layout.ExtractFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_extractFile.html Northcode Help Documentation
		*/
		public function ExtractFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param resourceSTR
		*
		* @param destinationSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_extractFile.html Northcode Help Documentation
		*/
		public function extractFile( resourceSTR:String = null , destinationSTR:String = null ):void
		{
			resource = compareStrings( resourceSTR , resource );
			destination = compareStrings( destinationSTR , destination );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					switch( destination )
					{
						case null:
							missingDestination();
							break;
						default:
							ssCore.Layout.extractFile( {destination:destination , resource:resource}
													  ,{callback:actionComplete, errorSTR:"extractFileError", code:"26000"} );
					}
			}
		}

	}
}