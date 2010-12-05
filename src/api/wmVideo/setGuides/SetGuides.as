package api.wmVideo.setGuides
{
	import api.events.wmVideo.setGuides.SetGuidesEvent;

	import api.vos.wmVideo.SetGuidesVO;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Link the edges of the video object to guides for automatic resizing of the video window that matches the player window's client area.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setGuides.html Northcode Help Documentation
	*/
	public class SetGuides extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var guides:SetGuidesVO = new SetGuidesVO();
		
		/**
		* Constructor for WmVideo.SetGuides()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setGuides.html Northcode Help Documentation
		*/
		public function SetGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Link the edges of the video object to guides for automatic resizing of the video window that matches the player window's client area.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setGuides.html Northcode Help Documentation
		*/
		public function setGuides():void
		{
			ssCore.WmVideo.setGuides( guides
									,{callback:actionComplete, errorSTR:"setGuidesError", code:"46007"} );
		}
	}
}