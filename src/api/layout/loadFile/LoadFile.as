package api.layout.loadFile
{
	import api.events.layout.loadFile.LoadFileEvent;

	import api.layout.Layout;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>resource</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_RESOURCE
	*/
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.layout.loadFile.LoadFileEvent.RESULT
	*/
	[Event(name="result", type="api.events.layout.loadFile.LoadFileEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_loadFile.html Northcode Help Documentation
	*/
	public class LoadFile extends Layout
	{		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Layout.LoadFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_loadFile.html Northcode Help Documentation
		*/
		public function LoadFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param resourceSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Layout_loadFile.html Northcode Help Documentation
		*/
		public function loadFile( resourceSTR:String = null ):void
		{
			resource = compareStrings( resourceSTR , resource );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					ssCore.Layout.loadFile( {resource:resource}
										   ,{callback:actionComplete, errorSTR:"loadFileError", code:"26002"} );
			}
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
			data = r.result
			
			var e : LoadFileEvent = new LoadFileEvent( LoadFileEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}