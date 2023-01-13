package com.shinsegae.ssgssag.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.shinsegae.ssgssag.recipe.service.RecipeCatService;
import com.shinsegae.ssgssag.recipe.service.RecipeDesService;
import com.shinsegae.ssgssag.recipe.service.RecipeIngService;
import com.shinsegae.ssgssag.recipe.service.RecipeService;
import com.shinsegae.ssgssag.recipe.service.RecipeTagService;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Controller
public class RecipeController {

	@Autowired
	RecipeService service;
	@Autowired
	RecipeDesService service_des;
	@Autowired
	RecipeIngService service_ing;
	@Autowired
	RecipeTagService service_tag;
	@Autowired
	RecipeCatService service_cat;
	
//	// 전체 조회 - 여러 건 응답 (JSON 배열)
//	@GetMapping("/recipe/recipe.ssg")
//	public String getAll(HttpServletRequest req, RecipeVO vo) {
//		System.out.println("### Recipe Controller ###");
//		List<RecipeVO> obj = service.reci(vo);	// 서비스 호출
//		req.setAttribute("list", obj);
//		return "recipe/recipe";
//	}
	
	@GetMapping("/recipe/recipe_search.ssg")
	public String getIng(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Ingredient Controller ###");
		System.out.println(vo.getRname());
		List<RecipeVO> obj = service.reci(vo);	// Service
		System.out.println("checkpoint");

		int total = obj.size();
		int cur = vo.getCurpage();
		vo.setCurpage(cur);
		if (total % 5 == 0 ) {
			vo.setTotal_count(total/5);
		}
		else {
			vo.setTotal_count(total/5 + 1);
		}
		vo.setStart((cur-1)*5);
		List<RecipeVO> obj2 = service.rcp_page(vo);
		int s = cur;
		while (s % 5 != 1) {
			s -= 1;
		}
		List<Integer> pagebutton = new ArrayList<>();
		for ( int i = 0; i<5; i++) {
			if (s+i <= vo.getTotal_count()) {
				pagebutton.add(s+i);
			}
		}
		req.setAttribute("list", obj2);
		req.setAttribute("page", pagebutton);

		return "recipe/recipe";
	}
	
	@GetMapping("/recipe/recipe_cat.ssg")
	public String getCats(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Category Controller ###");
		List<RecipeVO> obj = service_cat.cats(vo);
		req.setAttribute("list_cat", obj);
		return "recipe/recipe_cat";
	}

	@GetMapping("/recipe/recipe_tag.ssg")
	public String getTags(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Tag Controller ###");
		List<RecipeVO> obj = service_tag.tags(vo);
		req.setAttribute("list_tag", obj);
		return "recipe/recipe_tag";
	}

	@GetMapping("/recipe/recipe_des.ssg")
	public String test(HttpServletRequest req, RecipeVO vo) {
		List<RecipeVO> obj = service_des.getIngs(vo);
		List<RecipeVO> obj2 = service_des.getSteps(vo);
		req.setAttribute("list_ing", obj);
		req.setAttribute("list_step", obj2);
		System.out.println("### Recipe Ing Controller ###");
		return "recipe/recipe_des";
	}
	
	@GetMapping("/recipe/recipe_ing.ssg")
	public String getMaking(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Recipe Ing Controller ###");
		List<RecipeVO> obj = service_ing.ings(vo);
		List<RecipeVO> obj2 = service_ing.nut(vo);
		req.setAttribute("list_detail", obj);
		req.setAttribute("list_nut", obj2);
		return "recipe/recipe_ing";
	}
}