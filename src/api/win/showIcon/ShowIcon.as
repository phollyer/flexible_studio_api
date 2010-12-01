package api.win.showIcon
{
	import api.events.win.showIcon.ShowIconEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showIcon.html Northcode Help Documentation
	*/
	public class ShowIcon extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.ShowIcon()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showIcon.html Northcode Help Documentation
		*/
		public function ShowIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showIcon.html Northcode Help Documentation
		*/
		public function showIcon():void
		{
			ssCore.Win.showIcon( {flag:flag}
								,{callback:actionComplete, errorSTR:"showIconError", code:"6035"} );
		}
	}
}