package api.win.startDrag
{
	import api.events.win.startDrag.StartDragEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_startDrag.html Northcode Help Documentation
	*/
	public class StartDrag extends Win
	{
		/**
		* Constructor for Win.StartDrag()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_startDrag.html Northcode Help Documentation
		*/
		public function StartDrag(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_startDrag.html Northcode Help Documentation
		*/
		public function startDrag():void
		{
			ssCore.Win.startDrag( {}
								 ,{callback:actionComplete, errorSTR:"startDragError", code:"6036"} );
		}
	}
}