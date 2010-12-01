package api.win.setPosition
{
	import api.events.win.setPosition.SetPositionEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setPosition.html Northcode Help Documentation
	*/
	public class SetPosition extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		/**
		* Constructor for Win.SetPosition()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setPosition.html Northcode Help Documentation
		*/
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setPosition.html Northcode Help Documentation
		*/
		public function setPosition():void
		{
			ssCore.Win.setPosition( {x:x , y:y}
								   ,{callback:actionComplete, errorSTR:"setPositionError", code:"6026"} );
		}
	}
}