package api.sysTools.getImageInfo
{
	import api.events.sysTools.getImageInfo.GetImageInfoEvent;

	import api.sysTools.SysTools;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysTools.getImageInfo.GetImageInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysTools.getImageInfo.GetImageInfoEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_getImageInfo.html Northcode Help Documentation
	*/
	public class GetImageInfo extends SysTools
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var height:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var width:Number = 0;
		
		/**
		* Constructor for SysTools.GetImageInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_getImageInfo.html Northcode Help Documentation
		*/
		public function GetImageInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_getImageInfo.html Northcode Help Documentation
		*/
		public function getImageInfo( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.SysTools.getImageInfo( {path:path}
												 ,{callback:actionComplete, errorSTR:"getImageInfoError", code:"39002"} );
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
			height = Number( r.height );
			width = Number( r.width );
			
			var e : GetImageInfoEvent = new GetImageInfoEvent( GetImageInfoEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}