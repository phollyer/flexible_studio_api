package api.wmVideo.setFlags
{
	import api.events.wmVideo.setFlags.SetFlagsEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setFlags.html Northcode Help Documentation
	*/
	public class SetFlags extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var lockPosition:Boolean = true;
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var lockSize:Boolean = true;
		
		/**
		* Constructor for WmVideo.SetFlags()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setFlags.html Northcode Help Documentation
		*/
		public function SetFlags(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setFlags.html Northcode Help Documentation
		*/
		public function setFlags():void
		{
			ssCore.WmVideo.setFlags( {lockPosition:lockPosition , lockSize:lockSize}
									,{callback:actionComplete, errorSTR:"setFlagsError", code:"46005"} );
		}
	}
}