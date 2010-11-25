package api.app.showFileSave
{
	import api.app.App;

	import api.events.app.showFileSave.ShowFileSaveEvent;

	import api.vos.app.showFileSave.ShowFileSaveVO;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>fileOBJ</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FILE_OBJ
	*/
	[Event(name="missingFileOBJ" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.app.showFileSave.ShowFileSaveEvent.RESULT
	*/
	[Event(name="result", type="api.events.app.showFileSave.ShowFileSaveEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFileSave.html Northcode Help Documentation
	*/
	public class ShowFileSave extends App
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fileSaveOBJ:ShowFileSaveVO = null;
		
		/**
		* Constructor for App.ShowFileSave()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFileSave.html Northcode Help Documentation
		*/
		public function ShowFileSave(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param showFileSaveVO
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showFileSave.html Northcode Help Documentation
		*/
		public function showFileSave( showFileSaveVO:ShowFileSaveVO ):void
		{
			fileSaveOBJ = compare( showFileSaveVO , fileSaveOBJ );
			switch( fileSaveOBJ )
			{
				case null:
					missingFileOBJ();
					break;
				default:
					ssCore.App.showFileSave( fileSaveOBJ , {callback:actionComplete, errorSTR:"showFileSaveError", code:"8019"} );
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
			var e : ShowFileSaveEvent = new ShowFileSaveEvent( ShowFileSaveEvent.RESULT );
			e.file = r.result;
			e.filterIndex = r.filterIndex;
			e.filterMask = r.filterMask;
			e.filterName = r.filterName;
			dispatchEvent( e );
		}
		private function compare( first:ShowFileSaveVO , second:ShowFileSaveVO ):ShowFileSaveVO
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