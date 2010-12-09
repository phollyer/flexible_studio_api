package api.wmVideo.clearGuides
{
	import api.events.wmVideo.clearGuides.ClearGuidesEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Stop using guides for automatic resizing of the video window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_clearGuides.html Northcode Help Documentation
	*/
	public class ClearGuides extends WmVideo
	{
		/**
		* Constructor for WmVideo.ClearGuides()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_clearGuides.html Northcode Help Documentation
		*/
		public function ClearGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Stop using guides for automatic resizing of the video window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_clearGuides.html Northcode Help Documentation
		*/
		public function clearGuides():void
		{
			ssCore.WmVideo.clearGuides( {}
									   ,{callback:actionComplete, errorSTR:"clearGuidesError", code:"46000"} );
		}
	}
}