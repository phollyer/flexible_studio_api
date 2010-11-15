package api.app.showFileOpen
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.showFileOpen.ShowFileOpenEvent;
	import api.vos.app.showFileOpen.ShowFileOpenVO;
	
	[Event(name="missingFileOBJ" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.ShowFileOpen.Event.RESULT
	 */
	[Event(name="result", type="api.events.app.showFileOpen.ShowFileOpenEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFileOpen.html Northcode Help Documentation
	 */
	public class ShowFileOpen extends App
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>new</code>
		 */
		public var fileOpenOBJ:ShowFileOpenVO = new ShowFileOpenVO();
		
		/**
		 * Constructor for App.ShowFileOpen()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFileOpen.html Northcode Help Documentation
		 */
		public function ShowFileOpen(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param showFileOpenVO
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFileOpen.html Northcode Help Documentation
		 */
		public function showFileOpen( showFileOpenVO:ShowFileOpenVO = null ):void
		{
			fileOpenOBJ = compare( showFileOpenVO , fileOpenOBJ );
			switch( fileOpenOBJ )
			{
				case null:
					missingFileOBJ();
					break;
				default:
					ssCore.App.showFileOpen( {caption:fileOpenOBJ.caption
											 ,path:fileOpenOBJ.path
											 ,filter:fileOpenOBJ.filter
											 ,multipleSelect:fileOpenOBJ.multipleSelect
											 ,style:fileOpenOBJ.style} , {callback:actionComplete, errorSTR:"showFileOpenError", code:"8001"} );
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
			var __fileList:Array = r.result.split( "\r" );
			
			var e : ShowFileOpenEvent = new ShowFileOpenEvent( ShowFileOpenEvent.RESULT );
			e.file = __fileList[ 0 ];
			e.fileList = __fileList;
			e.filterIndex = r.filterIndex;
			e.filterMask = r.filterMask;
			e.filterName = r.filterName;
			dispatchEvent( e );
		}
		private function compare( first:ShowFileOpenVO , second:ShowFileOpenVO ):ShowFileOpenVO
		{
			switch( first != null )
			{
				case true:
					second = first;
			}
			return second;
		}
	}
}