package api.win.showBorder
{
	import api.events.win.showBorder.ShowBorderEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showBorder.html Northcode Help Documentation
	*/
	public class ShowBorder extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.ShowBorder()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showBorder.html Northcode Help Documentation
		*/
		public function ShowBorder(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showBorder.html Northcode Help Documentation
		*/
		public function showBorder():void
		{
			ssCore.Win.showBorder( {flag:flag}
								  ,{callback:actionComplete, errorSTR:"showBorderError", code:"6032"} );
		}
	}
}